require "spec_helper"

describe Lita::Handlers::DailyHomily, lita_handler: true do
  context "routes" do
  end

  describe "#body" do

    let(:body) { subject.response.body }

    it "has some html inside the response body" do
      expect(body =~ /<html>/i).to be_truthy
    end

    it "should include something that looks like an image tag" do
      expect(body =~ /img class/i).to be_truthy
    end
  end

  describe "#parsed_response" do
    let(:body_response) { subject.parsed_response }
    it "should return a nokogiri objetc with a :css method we can search on" do
      expect(body_response).to respond_to(:css)
    end

    it "should have images" do
      images = body_response.css("img")
      expect(images.any?).to be_truthy
    end
  end

  describe "#last_post" do
    it "has one element" do
      expect(subject.last_post.count).to eq(1)
    end
  end

  describe "#image" do
    it "has an image" do
      attributes = subject.image.attributes
      expect(attributes.fetch("src").value).to include("http")
    end
  end

  describe "#title" do
    it "has a title" do
      expect(subject.title.count).to eq(1)
    end
  end

  describe "#daily_homily" do
    it "returns title and image" do
      send_message "Lita homilia-diaria"
      expect(replies.last.include?("http")).to be_truthy
    end
  end
end
