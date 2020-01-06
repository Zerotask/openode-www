# frozen_string_literal: true

module ApplicationHelper
  def title
    if content_for?(:title)
      content_for :title
    else
      t("#{controller_path.tr('/', '.')}.#{action_name}.title", default: :site_name)
    end
  end

  def directory_hash(path, name=nil, exclude = [])                                
    exclude.concat(['..', '.', '.git', '__MACOSX', '.DS_Store'])   

    data = {:text => (name || path)}                                             
    data[:children] = children = []                                               

    Dir.foreach(path) do |entry|                                                  
      next if exclude.include?(entry) || entry.downcase.include?('.json')                                       
      full_path = File.join(path, entry)                                          
      if File.directory?(full_path)                                               
        children << directory_hash(full_path, entry)                              
      else                                                                        
        children << {:icon => '', :text => entry.gsub(/.md|.mdx/,'')}    
      end                                                                         
    end                                                                           
    
    data.as_json.deep_symbolize_keys                                                               
  end  
end
