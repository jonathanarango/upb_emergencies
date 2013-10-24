module TooltipHelper
	def create_tooltip(element_id)
		"<script type='text/javascript'>$('document').ready(function(){$('#{element_id}').tooltip();})</script>".html_safe;
	end
end