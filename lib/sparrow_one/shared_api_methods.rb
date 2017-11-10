module SparrowOne
  module SharedAPIMethods

    def refund(params)
      with_error_handling do
        validate(params, requires: [:amount, :transid])
        post("refund", params)
      end
    end

    def void(params)
      with_error_handling do
        validate(params, requires: [:transid])
        post("void", params)
      end
    end

    def chargeback(params)
      with_error_handling do
        validate(params, requires: [:transid, :reason])
        post("chargeback", params)
      end
    end

    def decrypt(params)
      with_error_handling do
        validate(params, requires: [:fieldname, :token])
        post("decrypt", params)
      end
    end

    def add_customer(params)
      with_error_handling do
        validate(params, requires: [:firstname, :lastname])
        post("addcustomer", params)
      end
    end
    alias_method :addcustomer, :add_customer

    def update_customer(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("updatecustomer", params)
      end
    end
    alias_method :updatecustomer, :update_customer

    def add_payment_type(params)
      with_error_handling do
        unless params.keys.select { |key| key.to_s =~ /token_\d*/ }.any?
          raise RequestError, "Add payment type must have customer token `token` and payment type token `token_#`."
        end
        validate(params, requires: [:token, :operationtype_1])
        post("updatecustomer", params)
      end
    end

    def delete_payment_type(params)
        with_error_handling do
          unless params.keys.select { |key| key.to_s =~ /token_\d*/ }.any?
            raise RequestError, "Add payment type must have customer token `token` and payment type token `token_#`."
          end
          validate(params, requires: [:token, :operationtype_1])
          post("updatecustomer", params)
        end
      end

    def get_customer(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("getcustomer", params)
      end
    end
    alias_method :getcustomer, :get_customer

    def delete_payment_type(params)
      with_error_handling do
        validate(params, requires: [:token, :token_1])
        post("updatecustomer", params.merge(operationtype_1: 'deletepaytype'))
      end
    end
    alias_method :deletepaymenttype, :delete_payment_type

    def delete_customer(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("deletecustomer", params)
      end
    end
    alias_method :deletecustomer, :delete_customer

    def add_plan(params)
      with_error_handling do
        validate(params, requires: [:planname, :plandesc, :startdate])
        post("addplan", params)
      end
    end
    alias_method :addplan, :add_plan

    def update_plan(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("updateplan", params)
      end
    end
    alias_method :updateplan, :update_plan

    def delete_plan(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("deleteplan", params)
      end
    end
    alias_method :deleteplan, :delete_plan

    def add_sequence(params)
      with_error_handling do
        validate(params, requires: [:token])
        post("updateplan", params)
      end
    end

    def assign_plan(params)
      with_error_handling do
        validate(params, requires: [:customertoken, :plantoken, :paymenttoken])
        post("assignplan", params)
      end
    end
    alias_method :assignplan, :assign_plan

    def update_assignment(params)
      with_error_handling do
        validate(params, requires: [:assignmenttoken])
        post("updateassignment", params)
      end
    end
    alias_method :updateassignment, :update_assignment
    alias_method :updateplanassignment, :update_assignment
    alias_method :update_plan_assignment, :update_assignment

    def cancel_assignment(params)
      with_error_handling do
        validate(params, requires: [:assignmenttoken])
        post("cancelassignment", params)
      end
    end
    alias_method :cancelassignment, :cancel_assignment
    alias_method :cancelplanassignment, :cancel_assignment
    alias_method :cancel_plan_assignment, :cancel_assignment

    def create_invoice(params)
      with_error_handling do
        validate(params, requires: [:invoicedate, :currency, :invoicestatus])
        post("createmerchantinvoice", params)
      end
    end
    alias_method :createinvoice, :create_invoice

    def get_invoice(params)
      with_error_handling do
        validate(params, requires: [:invoicenumber])
        post("getinvoice", params)
      end
    end

    def update_invoice(params)
      with_error_handling do
        validate(params, requires: [:invoicenumber])
        post("updateinvoice", params)
      end
    end
    alias_method :updateinvoice, :update_invoice

    def pay_invoice(params)
      with_error_handling do
        validate(params, requires: [:invoicenumber])
        post("payinvoice", params)
      end
    end
    alias_method :payinvoice, :pay_invoice

    def cancel_invoice(params)
      with_error_handling do
        validate(params, requires: [:invoicenumber, :invoicestatusreason])
        post("cancelinvoice", params)
      end
    end
    alias_method :cancelinvoice, :cancel_invoice

    def cancel_invoice_by_customer(params)
      with_error_handling do
        validate(params, requires: [:invoicenumber, :invoicestatusreason])
        post("cancelinvoicebycustomer", params)
      end
    end

  end
end
