class ProductsDatatable
delegate :params, :h, :link_to, :price, to: :@view

def initialize(view)
  @view = view
end

def as_json(options = {})
  {
    sEcho: params[:sEcho].to_i,
    iTotalRecords: Product.count,
    iTotalDisplayRecords: products.total_entries,
    aaData: data
  }
end

  def products
    @products ||= fetch_products
  end

private
def data
  products.map do |product|
    [
      link_to(product.name, product),
      (product.categoty),
      (product.categoty),
      (product.categoty),
      (product.categoty),
      if product.categoty == 'test'
     link_to('Details','http://localhost:3000/products/' + product.id.to_s + '?iframe=true&width=400&height=200',{rel: "prettyPhoto", class: "pretty"} ) 
      else
     link_to('Detailsiiiiiiiii','http://localhost:3000/products/' + product.id.to_s + '?iframe=true&width=400&height=200',{rel: "prettyPhoto", class: ""} ) 
      end
	
    ]
  end
end


def fetch_products
  products = Product.order("#{sort_column} #{sort_direction}")
  products = products.page(page).per_page(per_page)
  if params[:sSearch].present?
    products = products.where("name like :search or categoty like :search", search: "%#{params[:sSearch]}%")
  end
  products
  
end

 def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end


