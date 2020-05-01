@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                    <!-- <a style="margin: 19px;" href="{{ route('company.index')}}" class="btn btn-primary">Company List</a>
                    <a style="margin: 19px;" href="{{ route('employee.index')}}" class="btn btn-primary">Employee List</a> -->
                    <a style="margin: 19px;" href="{{ route('product.index')}}" class="btn btn-primary">Product List</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
