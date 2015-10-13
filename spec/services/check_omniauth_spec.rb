require "rails_helper"

describe CheckOmniauth do
  let(:auth) { double(:omniauth, provider: provider) }

  describe ".verified?" do
    subject { described_class.verified?(auth) }

    context "when provider is Facebook" do
      let(:provider) { "facebook" }

      before do
        allow(auth).to receive_message_chain(:info, :verified?).and_return(true)
      end

      it "returns corresponding value" do
        expect(subject).to eq(true)
      end
    end

    context "when provider is Google" do
      let(:provider) { "google_oauth2" }

      before do
        allow(auth).to receive_message_chain(:extra, :raw_info, :email_verified?).and_return(true)
      end

      it "returns corresponding value" do
        expect(subject).to eq(true)
      end
    end

    context "when provider is not in the case statement" do
      let(:provider) { "another" }

      it "raises Exception" do
        expect { subject }
          .to raise_error(ArgumentError, "Verification checking is not implemented for provider: '#{auth.provider}'")
      end
    end
  end
end
