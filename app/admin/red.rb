ActiveAdmin.register Red do
	index do
		column :user_id
		column "Domain",:email
		column "Global Rank",:global
		column "Country Rank",:country


	end
end
