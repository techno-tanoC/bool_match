require 'spec_helper'

describe BoolMatch do
  include BoolMatch

  def case_match matcher, obj
    case obj
    when matcher then true
    else false
    end
  end

  shared_examples "matcher" do
    it "return current for true" do
      expect(case_match subject, true).to be true_ans
    end
    it "return current for false" do
      expect(case_match subject, false).to be false_ans
    end
    it "return current for not nil" do
      expect(case_match subject, 1).to be truthy_ans
    end
    it "return current for nil" do
      expect(case_match subject, nil).to be nil_ans
    end
    it "return current for empty" do
      expect(case_match subject, []).to be empty_ans
    end
  end

  describe BoolMatch::Truthy do
    it_behaves_like "matcher" do
      let(:true_ans) { true }
      let(:false_ans) { false }
      let(:truthy_ans) { true }
      let(:nil_ans) { false }
      let(:empty_ans) { true }
    end
  end

  describe BoolMatch::Falsy do
    it_behaves_like "matcher" do
      let(:true_ans) { false }
      let(:false_ans) { true }
      let(:truthy_ans) { false }
      let(:nil_ans) { true }
      let(:empty_ans) { false }
    end
  end

  describe BoolMatch::Blank do
    it_behaves_like "matcher" do
      let(:true_ans) { false }
      let(:false_ans) { true }
      let(:truthy_ans) { false }
      let(:nil_ans) { true }
      let(:empty_ans) { true }
    end
  end

  describe BoolMatch::Present do
    it_behaves_like "matcher" do
      let(:true_ans) { true }
      let(:false_ans) { false }
      let(:truthy_ans) { true }
      let(:nil_ans) { false }
      let(:empty_ans) { false }
    end
  end

  describe BoolMatch::Any do
    it_behaves_like "matcher" do
      let(:true_ans) { true }
      let(:false_ans) { true }
      let(:truthy_ans) { true }
      let(:nil_ans) { true }
      let(:empty_ans) { true }
    end
  end
end
