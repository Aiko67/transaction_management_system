require "csv"

class TransactionsController < ApplicationController
    CSV_FILE = Rails.root.join("transactions.csv")

  def index
    @transactions = CSV.read(CSV_FILE, headers: true).map(&:to_h)
  end

  def new
  end

  def create
    status = ["Pending", "Settled", "Failed"]

    if required_field_blank
      flash[:error] = "All fields are required."
      return render :new, status: :unprocessable_entity
    end

    digits_only = params[:account_number]

    unless digits_only.length == 12
      flash[:error] = "Account number must have exactly 12 digits."
      return render :new, status: :unprocessable_entity
    end

    formatted_account_number = digits_only.scan(/.{1,4}/).join("-")
    account_holder_name = params[:account_holder_name]

    existing_transactions = CSV.read(CSV_FILE, headers: true).map(&:to_h)
    existing_account = existing_transactions.find { |t| t["Account Number"] == formatted_account_number }

    if existing_account && existing_account["Account Holder Name"] != account_holder_name
      flash[:error] = "Account number '#{formatted_account_number}' is already assigned to another account holder. Please update Account Holder Name."
      return render :new, status: :unprocessable_entity
    end

    new_transaction = [
      params[:transaction_date],
      formatted_account_number,
      params[:account_holder_name],
      params[:amount],
      status.sample
    ]

    File.open(CSV_FILE, "a") do |f|
      f.write("\n") unless File.zero?(CSV_FILE) || File.read(CSV_FILE)[-1] == "\n"
    end

    CSV.open(CSV_FILE, "a") do |csv|
      csv << new_transaction
    end

    flash[:success] = "Transaction added successfully."
    redirect_to root_path
  end

  private

  def required_field_blank
    params[:transaction_date].blank? ||
    params[:account_number].blank? ||
    params[:account_holder_name].blank? ||
    params[:amount].blank?
  end
end
