module Slugifiable
    module InstanceMethods
        def slug
            def slug()
                subs = {
                    ',' => '',
                    "'" => '',
                    ' ' => '-',
                    '.' => ''
                }
                self.name.downcase.gsub(/\W/,subs)
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find {|x| x.slug==slug}
        end
    end
    
end