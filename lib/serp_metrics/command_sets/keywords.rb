module SerpMetrics
  module CommandSets
    class Keywords < Base
      def add(keyword, engines, options = {})
        transaction_options = {
          :keyword => keyword,
          :engines => engines
        }.merge(options)
        transact(:post, '/keywords/add', transaction_options)
      end

      def remove(keyword_id, options = {})
        transaction_options = {
          :keyword_id => keyword_id,
        }.merge(options)
        transact(:post, '/keywords/delete', transaction_options)
      end

      def check(keyword_id, engine, options = {})
        transaction_options = {
          :keyword_id => keyword_id,
          :engine => engine,
          :limit => 10
        }.merge(options)
        transact(:post, '/keywords/check', transaction_options)
      end

      def serp(check_id, options = {})
        transaction_options = {
          :check_id => check_id,
          :domain => nil
        }.merge(options)
        transact(:post, '/keywords/serp', transaction_options)
      end

      def all(options = {})
        transact(:post, '/keywords/all', options)
      end
    end
  end
end
