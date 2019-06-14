class CfeConsumption < ApplicationRecord
  belongs_to :municipality

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      begin
        state_id = row[0].to_i
        municipality_code = "%03d" % row["cve_mun"].to_i
        municipality = State&.find(state_id)&.municipalities&.where(code: municipality_code)&.first || Municipality.find(9999)
        cfe_fee = row["fee"]&.gsub(/[\s]/ ,"") || '999'
        intake_kwh_2010 = row["2010"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2011 = row["2011"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2012 = row["2012"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2013 = row["2013"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2014 = row["2014"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2015 = row["2015"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2016 = row["2016"]&.gsub(/[\s,]/ ,"")&.to_i || 0
        intake_kwh_2017 = row["2017"]&.gsub(/[\s,]/ ,"")&.to_i || 0

        year2010 = Date.strptime('01-01-2010', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2010, intake_kwh: intake_kwh_2010, municipality: municipality)
        year2011 = Date.strptime('01-01-2011', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2011, intake_kwh: intake_kwh_2011, municipality: municipality)
        year2012 = Date.strptime('01-01-2012', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2012, intake_kwh: intake_kwh_2012, municipality: municipality)
        year2013 = Date.strptime('01-01-2013', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2013, intake_kwh: intake_kwh_2013, municipality: municipality)
        year2014 = Date.strptime('01-01-2014', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2014, intake_kwh: intake_kwh_2014, municipality: municipality)
        year2015 = Date.strptime('01-01-2015', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2015, intake_kwh: intake_kwh_2015, municipality: municipality)
        year2016 = Date.strptime('01-01-2016', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2016, intake_kwh: intake_kwh_2016, municipality: municipality)
        year2016 = Date.strptime('01-01-2017', '%d-%m-%Y')
        CfeConsumption.create(cfe_fee: cfe_fee, year: year2016, intake_kwh: intake_kwh_2017, municipality: municipality)
      rescue
        puts 'ERROR HANDLED'
      end
    end
  end
end
