Rails.application.routes.draw do
	resources :bullshits
	root "bullshits#welcome"
end
