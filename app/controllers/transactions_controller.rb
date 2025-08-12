require "csv"

class TransactionsController < ApplicationController
    CSV_FILE = Rails.root.join("transactions.csv")

  def index
    @transactions = CSV.read(CSV_FILE, headers: true).map(&:to_h)
  end

  def new
  end

  def create
      statuses = ["Pending", "Settled", "Failed"]

    if params[:transaction_date].blank? ||
      params[:account_number].blank? ||
      params[:account_holder_name].blank? ||
      params[:amount].blank?

      flash[:error] = "All fields are required."
      return render :new, status: :unprocessable_entity
    end

    digits_only = params[:account_number].gsub(/\D/, "")
    unless digits_only.length == 12
      flash[:error] = "Account number must have exactly 12 digits (e.g., 1234-5678-9012)."
      return render :new, status: :unprocessable_entity
    end

    formatted_account_number = digits_only.scan(/.{1,4}/).join("-")

    new_transaction = [
      params[:transaction_date],
      formatted_account_number,
      params[:account_holder_name],
      params[:amount],
      statuses.sample
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
end
