require 'unsorted_to_query/version'

module UnsortedToQuery

  refine Hash do
    # Returns a string representation of the receiver
    # suitable for use as a URL query string:
    #
    #   { name: 'David', nationality: 'Danish' }.to_query
    #   #=> "name=David&nationality=Danish"
    #
    # An optional namespace can be passed to enclose key names:
    #
    #   {name: 'David', nationality: 'Danish'}.to_query('user')
    #   #=> "user%5Bname%5D=David&user%5Bnationality%5D=Danish"
    #
    # NOTE: The string pairs "key=value" that confirm the query string
    # are NOT sorted lexicographically in ascending order on this patch.
    #
    # This method is also aliased as +to_param+
    def to_query(namespace = nil)
      collect do |key, value|
        unless (value.is_a?(Hash) || value.is_a?(Array)) && value.empty?
          value.to_query(namespace ? "#{namespace}[#{key}]" : key)
        end
      end.compact * '&'
    end
  end

end
