require 'net/http'
require 'uri'
require 'json'

class Logistics

  def self.create_package(params)
    weight = params[:weight].to_f
    length = params[:length].to_f
    width = params[:width].to_f
    height = params[:height].to_f
    dep_address = params[:dep_address].to_s
    arr_address = params[:arr_address].to_s
    url = URI("https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{dep_address}&destinations=#{arr_address}&key=on3Cb5KJtGXFbgvXCjSc9yrdI6k1D")
    distance = JSON.parse(Net::HTTP.get(url))['rows'][0]['elements'][0]['distance']['value'] / 1000
    price = if length / 100 * width / 100 * height / 100 < 1
              distance
            elsif weight < 10
              distance * 2
            else
              distance * 3
            end
    { weight: weight, length: length, width: width, height: height, distance: distance, price: price }
  end

  def self.input_from_cli
    puts 'Введите вес(кг), длину(см), ширину(см), высоту(см), пункт отправления и пункт назначения'
    { weight: gets.chomp.to_i, length: gets.chomp.to_i, width: gets.chomp.to_i, height: gets.chomp.to_i,
      dep_address: gets.chomp, arr_address: gets.chomp }
  end

end
