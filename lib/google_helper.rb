module GoogleHelper

  ##
  ## Relies on OR_CONFIG Hash. Refer to README
  ## 
  def javascript_include_google_analytics_tag(ssl = true)
    snippet = "<!-- No Google Analytics in #{RAILS_ENV} mode -->"
    unless OR_CONFIG[:GOOGLE_ANALYTICS_UACCT].nil?
      snippet = <<-CODE
<script src="https://ssl.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "#{OR_CONFIG[:GOOGLE_ANALYTICS_UACCT]}";
urchinTracker();
</script>
CODE
    end
    return snippet
  end

end
