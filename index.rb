require "bundler"
Bundler.require

WickedPdf.config = {
  exe_path: "#{Gem.loaded_specs['wkhtmltopdf-binary'].full_gem_path}/bin/wkhtmltopdf"
}

get "/" do
  "It works"
end

post "/pdf" do
  puts params[:options]
  pdf = WickedPdf.new.pdf_from_string(params[:view], params[:options])

  content_type "pdf"
  response["Content-Disposition"] = "inline"
  pdf
end
