json.extract! report, :id, :reportType, :generatedDate, :content, :created_at, :updated_at
json.url report_url(report, format: :json)
