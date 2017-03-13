class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    if stripe_token = params[:stripe_token]
      if current_user.do_deposit_transaction(params[:payment_type], stripe_token)
        flash[:notice] = 'Card charged successfully'
      else
        flash[:alert] = 'Some error happened while charging you, please double check your card details'
      end
    else
      flash[:alert] = 'You did not submit the form correctly'
    end

    redirect_to new_payment_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.fetch(:payment, {})
    end
end
