class PkController < ApplicationController
  def index
    grade = [ 2011, 2012, 2013, 2014 ]
    @studentnos = []
    6.times do
      pre_no =  grade[rand(4)]
      suf_4bit_no = rand(5000) + 1
      studentno = pre_no * 10000 + suf_4bit_no
      @studentnos << studentno
    end
  end

  def calculate
    result = params[:result]
    return :error if result.length!=6
    3.times do |i|
      girl1 = Girl.find_by_studentNo(result[2 * i])
      girl2 = Girl.find_by_studentNo(result[2 * i + 1])
      return :error if girl1.nil? || girl2.nil?
      logistic_distribution(girl1, girl2)
    end
    # redirect_to :controller => "girls", :action => "ranklist"
  end

  private

  def logistic_distribution(a, b, a_vs_b=1)
    return :error unless [1, 0].include?a_vs_b
    score_a = a.score
    score_b = b.score
    k = 32
    exp_a = 1.0 / (1.0 + 10 ** ((score_b-score_a)/400.0))
    exp_b = 1.0 / (1.0 + 10 ** ((score_a-score_b)/400.0))
    score_a = score_a + k * (a_vs_b - exp_a)
    score_b = score_b + k * (1 - a_vs_b - exp_b)
    a.score = score_a
    b.score = score_b
    a.save!
    b.save!
  end
end
