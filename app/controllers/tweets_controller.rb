class TweetsController < ApplicationController
  
  before_filter :must_be_admin, :except => [:index, :show]
  
  # GET /tweets
  # GET /tweets.json
  def index
    respond_to do |format|
      format.html { @tweets = Tweet.all }
      if this_one_should_fail_randomly?
        format.json { render json: json_error_message  }
        format.xml  { render xml:  xml_error_message   }
      else
        format.json { render json: Tweet.random_sample }
        format.xml  { render xml:  Tweet.random_sample }
      end
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
      format.xml  { render xml:  @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end
  
  private
  # Fail one in 5 times.
  def this_one_should_fail_randomly?
    (rand * 5).round == 0
  end
  
  def a_random_error_message
    messages = ["Something went wrong", "I don't know what happened there", "Don't blame me", "Server error", "ERROR #325757", "Server is down", "Server no respondy"]
    messages[(rand * messages.length - 1).round]
  end
  
  def json_error_message
    { error: { message: a_random_error_message } }
  end
  
  def xml_error_message
    { message: a_random_error_message }.to_xml(root: "error")
  end
end
