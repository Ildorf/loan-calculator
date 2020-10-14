class Renderer
  def initialize(format)
    @format = format
  end

  def render(entity_type, action, data)
    template_file = File.join(__dir__, '../app/views', entity_type, "#{action}.#{@format}.erb")
    template = File.read(template_file)
    view = ERB.new(template).result(data)
    view = Nokogiri::HTML(view).text.gsub(/[\r\n]+/,"\n").strip if @format == :html
    
    puts "="*50
    puts view
    puts "="*50
    puts "\n\n\n"
  end
end
