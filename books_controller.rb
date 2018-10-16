class BookController < ApplicationController

  def index
    # books = Book.all
    # render json: books

    # in our local host we see the html we wrote.
    # inside of books, we have all of the json.
    # instance variables is available to the index view it is under.
    @books = Book.all # go into template render, go ahead and call @books instance
    # variable. erb allows us to use ruby code in html.
    render :index # this is the view we want to render.
    # render this html template that we package up and send back to client.
  end


#show.html.erb
  def show

    @book = Book.find_by(id: params[:id])
    # render json: book

    # to resolve for cases that are nil
    if @book
      render :show
    else
      # return user to index page
      # render :index

      # books GET /book(:format...)
      redirect_to books_url # its great for nested routes!
      #go ahead and redirect and make a request at books_url
      # THERE CAN ONLY BE ONE, redirect that is.
    end

    # ex: This is a double render error!!!!!
    # unless @book
    #   redirect_to books_url
    # end
    #
    # render :show

  # end and never hit render.
    unless @book
      redirect_to books_url
      return
    end

    render :show
  end

  # what we want to do is show some html back to the user.

  # I want this to be the view . erb, embedded ruby code.
  # label to mtch controller.

#------------------------------------------------------------------


  def new
    # :new is the route and corresponding view the user wants to get the form.
      render :new
  end

  def create
    # create instance of a book.
    @book = Book.new(book_params) # model level instance of book.
    # general pattern is to create a book instance then save.
    #paramss = {book: {title: 'HP', }}
    #params = {user: {name: 'clair', admin: true}} malicious key of admin.
    # we use strong params to filter out params until we get only those we deem acceptable.

    if @book.save
      # show user the book show page.
      redirect_to book_url(@book.id) # pop back into show.
    else
      # show the user the new book form.

      render :new
    end
  end

  def edit
    # find_by if does not find book , return nil, instead of exception find(...)
    @book = Book.find_by(id: params[:id])
    render :edit
  end

  def update
    @book = Book.find_by(id: params[:id])

    if @book.update_attributes # attempt to update, returns true or false
      redirect_to book_irl(@book)
    else
      render :edit,
    end
  end

  private
  def book_params
    # permit only lets these specific params through. We are safe knowing no malicious data is going through like 'admin'
    # from a hacker.
    params.require(:book).permit(:title, :author, :year, :description, :category)
  end
end
