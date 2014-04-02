module MessagesHelper
  def linkify(text)
    text = h(text).gsub('&quot;', '"')
    text.gsub!(/(https?:\/\/[^\s"]+)/, '<a href="\1" target="_blank">\1</a>')
    text.gsub!(/@(\w{2})\w+/, '@\1------') unless user_signed_in?
    text.sub(/^\/code\s(.*)$/, '<pre>\1</pre>').
         gsub(/\\n/, "\n").html_safe
  end
end