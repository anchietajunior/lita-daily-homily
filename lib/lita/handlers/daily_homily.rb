require 'nokogiri'

module Lita
  module Handlers
    class DailyHomily < Handler

      SITE_URL = "https://padrepauloricardo.org/programas/homilia-diaria".freeze

      route /homilia-diaria/,
      :daily_homily,
      command: true,
      help: {
        "homilia-diaria" => "latest daily homily from padrepauloricardo"
      }

      def response
        @_response ||= http.get(SITE_URL)
      end

      def parsed_response
        Nokogiri.parse(response.body)
      end

      def last_post
        parsed_response.css("div.last-episode").first
      end

      def image
        last_post.css("img.last-episode__image").first
      end

      def title
        parsed_response.css("span.last-episode__title").first
      end

      def daily_homily response
        response_title = title.text.strip
        response_img = image.get_attribute("src")
        msg = "#{response_title} - #{response_img}"
        response.reply msg
      end

      Lita.register_handler(self)
    end
  end
end
