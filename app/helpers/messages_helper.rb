module MessagesHelper
  def linkify(text)
    text = h(text).gsub('&quot;', '"')
    text.gsub!(/(https?:\/\/[^\s"]+)/, '<a href="\1" target="_blank">\1</a>')
    text.sub(/^\/code\s(.*)$/, '<pre>\1</pre>').
         gsub(/\\n/, "\n").html_safe
  end
end