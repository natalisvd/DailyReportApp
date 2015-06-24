class LeadsController < ApplicationController

  def filter
    @business_entity=BusinessEntity.all.inject([]){|result, be| result<<[be.name_short_or_name, be.id]}
  end
  def daily
    @business_entity=BusinessEntity.all.inject([]){|result, be| result<<[be.name_short_or_name, be.id]}
    if params[:from]
      @leads = Lead.where(
          :created_at => Date.strptime(params[:from], '%Y, %m, %d')..Date.strptime(params[:to], '%Y, %m, %d'),
          :lead_source => params[:lead_source_list].split(','),
          :interested_company_id => params[:business_entity_name].split(',')
      )

      @leads_fil = @leads.apply_filter(params[:status])
      if params[:convert]=='1'
        @leads_fil= @leads_fil.where.not(:contract_id => nil)
      end
      @leads_date = @leads_fil.order(:created_at).pluck(:created_at).uniq
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string', 'Date')
      data_table.new_column('number', 'Leads Count')
      @leads_date.each  do |date|
        data_table.add_rows([
                              [date.strftime("%d/%m/%Y"), @leads_fil.where(:created_at =>date).count]
                          ])
      end
      option = { width: 460, height: 270, title: 'Company Performance' }
      @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)

    end
    respond_to do |format|
      format.html
      format.csv {send_data @leads_fil.to_csv } if @leads_fil
    end
  end


end
