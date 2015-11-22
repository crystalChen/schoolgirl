class AddGirls < ActiveRecord::Migration
  def up
    (20110001..20115000).each do |i|
      i = Girl.find_or_create_by_studentNo(i.to_s);i.update_attributes({:score=>1400.0},without_protection: true);
    end
    (20120001..20125000).each do |i|
      i = Girl.find_or_create_by_studentNo(i.to_s);i.update_attributes({:score=>1400.0},without_protection: true);
    end
    (20130001..20135000).each do |i|
      i = Girl.find_or_create_by_studentNo(i.to_s);i.update_attributes({:score=>1400.0},without_protection: true);
    end
    (20140001..20145000).each do |i|
      i = Girl.find_or_create_by_studentNo(i.to_s);i.update_attributes({:score=>1400.0},without_protection: true);
    end
  end

  def down
  end
end
