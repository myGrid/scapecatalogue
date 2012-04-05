module RoundedCornersHelper
  def rounded(background, color, width, &block)
		output = self
    style = "style=\"#{"background:#{background};" if background} color:#{color}\""
	  output.concat "<div class=\"rcontainer\" style=\"width:#{width};\">"
	  output.concat "<div class=\"rtop\">"
    output.concat "<div class=\"r1\" #{style}></div>"
    output.concat "<div class=\"r2\" #{style}></div>"
    output.concat "<div class=\"r3\" #{style}></div>"
    output.concat "<div class=\"r4\" #{style}></div>"
	  output.concat "</div>"
	  output.concat "<div class=\"rcontain\" #{style}>"
		block.call
		output.concat "</div>"
	  output.concat "<div class=\"rbottom\">"
    output.concat "<div class=\"r4\" #{style}></div>"
    output.concat "<div class=\"r3\" #{style}></div>"
    output.concat "<div class=\"r2\" #{style}></div>"
    output.concat "<div class=\"r1\" #{style}></div>"
	  output.concat "</div>"
	  output.concat "</div>"
	end
 
  # Added by Jits (2009-11-26)
  def rounded_html(background, color, width, &block)
    output = ""
    style = "style=\"#{"background:#{background};" if background} color:#{color}\""
    output.concat "<div class=\"rcontainer\" style=\"width:#{width};\">"
    output.concat "<div class=\"rtop\">"
    output.concat "<div class=\"r1\" #{style}></div>"
    output.concat "<div class=\"r2\" #{style}></div>"
    output.concat "<div class=\"r3\" #{style}></div>"
    output.concat "<div class=\"r4\" #{style}></div>"
    output.concat "</div>"
    output.concat "<div class=\"rcontain\" #{style}>"
    output.concat block.call
    output.concat "</div>"
    output.concat "<div class=\"rbottom\">"
    output.concat "<div class=\"r4\" #{style}></div>"
    output.concat "<div class=\"r3\" #{style}></div>"
    output.concat "<div class=\"r2\" #{style}></div>"
    output.concat "<div class=\"r1\" #{style}></div>"
    output.concat "</div>"
    output.concat "</div>"
    output
  end

end