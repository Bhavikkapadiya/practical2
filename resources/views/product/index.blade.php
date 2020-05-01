@extends('base')

@section('main')
<div class="row">
<div class="col-sm-12">
    <h1 class="display-5">Product List</h1>    
    <div>
    <a style="margin: 19px;" href="javascript:void(0)" data-toggle="modal" data-target="#import" class="btn btn-primary">Import Product</a>
    </div>

  <table class="table table-striped">
    <thead>
        <tr>
          <td>ID</td>
          <td>Title</td>
          <td>SKU</td>
          <td>Description</td>
          <td>Quantity</td>
          <td>Price</td>
          <td>Category</td>
        </tr>
    </thead>
    <tbody>
        <?php $i=0;?>
        @foreach($product as $key)
        <?php $i++;?>
        <tr>
            <td>{{$i}}</td>
            <td>{{$key->title}}</td>
            <td>{{$key->sku}}</td>
            <td>{{$key->description}}</td>
            <td>{{$key->quantity}}</td>
            <td>{{$key->price}}</td>
            <td>
              <?php 
                $cat_id = explode(',',$key->category_id);
                foreach($cat_id as $key1){
                  $cat_data = \App\Category::where(['id' => $key1])->pluck('title')->first();
                  echo $cat_data.',';
                }
              ?>
            </td>
        </tr>
        @endforeach
    </tbody>
  </table>
  {{ $product->links() }}
<div>
</div>

<div class="modal fade" id="import" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
      <h4 class="modal-title" >Import Product</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<form method='post' action="{{ route('import_parse') }}" enctype='multipart/form-data' id="product_form">
				{{ csrf_field() }}
			<div class="modal-body">
				<div class="row">
						<div class="col-xs-12 col-md-6">
							<label for="rn">CSV File</label>
							<div class="form-group">
                <input type="file" id="csv_file" class="form-control" name="csv_file" required>
							</div>
						</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type='submit' value='Import' class="btn btn-primary" id="submit">
			</div>
		</div>
	</form>
	</div>
</div>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script>
$(document).ready(function() {

});
</script>
@endsection