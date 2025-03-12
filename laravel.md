# LARAVEL

## Composer 

`composer require [package name ]`

## Install laravel
*Method 1 (Install globally)*
`composer global require laravel/installer`
*And then create the project*
- `laravel new [project name]`
*Method 2 (create the project)*
`composer create-project --prefer-dist laravel/laravel [project name]`
 
## Routing (`routes/web.php`)
*Method 1*
```php
Route::get(url, function()
{
    return view(view_name)
});
```
*Method 2*
With this method no need to add the '/' at the beginning of the url
```php
Route::view(url, view_name);
```

NB: Most of time the name of the views are followed by `blade`, then `php`. But we do not need to write all the file name neither with the `blade` keyword nor `php`.

**Pass data to the view**
```php
Route::get('url/{value}', function($value)
{
    return view(view_name, ['key'=>$value]);
});
```

*How to pass multiple values*

**Access to another page via anchors**
NB: the page name must be the same as the name of the page and again the same used for routing.
```html
<a href=page_name>Page Name</a>
```

**Redirections**
```php
Route::get(url, function()
{
    return redirect(url_of_the_redirection_page);
});
```
## Controller
The main objective of the controller is to fetch data from the model and retransfers it to the view
Controllers are located in `app/Http/Controllers`
**Create a controller**
```sh
php artisan make:controller [controller name]
```
or create it manually simply. 

NB: It is in the created controller class that must be defined the functfions returning the view or data we want it to do. 
Moreover, the namespace to the controller must be added in the top of the `web.php` file
**Call the controller in the routes**
```php
Route::get(url, [Controller::class, method_returning_the_view]);
```

**Call the controller in the routes and pass data**
```php
Route::get('url/{data}', [Controller::class, method_returning_the_view])
```
NB: `ClassName::class` => `the name of the namespace`

## View
They are located in the folder `./resources/views/`
The views are simply the part of the MVC, where the results fetched in the Model by the dedicated Controller will be showed up.

## Component
It is a piece of code that can be reused simply
>NB: The name of the component is advised to be in CamelCase
**Create a new component**
`php artisan make:component [component name]`
This automatically creates two files There are the path of both
- `./resources/views/components/ComponentName.blade.php`
- `./app/View/Components/ComponentName.php` : it is the file in which the component is designed

**How to call a componenent in a view ?**
```html
<!-- Some HTML tags above -->
<x-ComponentName />
<!-- Some HTML tags below -->
```

**How to pass data to a component and retrieve this data in the view**
```html
<!-- Some HTML tags above -->
<x-ComponentName data="Some data here ..."/>
<!-- Some HTML tags below -->
```
In the `./resources/views/components/ComponentName.blade.php`:
```php
<?php

namespace App\View\Components;

use Illuminate\View\Component;

class ComponentName extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public $data;
    public function __construct($data)
    {
        //
        $this->data = $data;   
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.componentname');
    }
}
```

## Blade Template
A template engine in Laravel, that converts plain text into a php code.

**How does it works ?**

|Pure PHP|Blade Template|
|--|--|
|`<?php //statements ?>`| `{{ //statements }}`|
|`<?php echo $i ?>`|`{{$i}}`|
|```if(condition){//statements }elseif(condition)statements}```|```@if(condition)//statements @elseif(condition) //statements @endif```|
|```for($i = 0; $i < $x ; $i++){//statements}```|```@for($i = 0; $i < $x ; $i++) //statements @endfor```|
|```foreach($array as $key){//statements}```|```@foreach($array as $key)//statements @enforeach```|

**How to include a view B in a view A ?**
Just call in the `A` the view `B` by the following `@include(viewBname)`

**How to pass PHP data to JS ?**
```js
<script>
    var data = @json($);
</script>
```
## Form Submition
The submition of form data are targeted to a controller.
1. Send a post request to a page that will handle the request. The `url` must not compulsorily have the extension followed.
```php
<form action=url method="POST">
    @csrf
    <!-- inputs are listed here -->
</form>
```
2. For a post targeting url, use a specified controller to handle it.
```php
Route::post(url, [ControllerClass::class, "controllerMethodHandlingData"]);
```
3. Write the controller
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ControllerClass extends Controller
{
    //
    function controllerMethodHandlingData(Request $req)
    {
        return $req->input();
    }
}
```

## Form Validation
The validation is done mainly in the controller that is aimed to handle data.
*Overview*
```php
$req->validate([
            'fieldname'=>"validation option",
        ]);
```
*Full description*
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ControllerClass extends Controller
{
    //
    function controllerMethodHandlingData(Request $req)
    {
        $req->validate([
            'field_x' => "option1 | option2",
            'field_y' => "option1 | option2",
        ]);
        return $req->input();
    }
}
```

**How to display errors to the view ?**
The differents raised errors are stored in a variable called `$errors`.
It could displayed as simple as possible by : `{{$errors}}`
or:
```php
@if($errors->any())//wheter there is an error or not
@foreach($errors->all() as $error)
{{error}}
@enforeach
@endif
```
or
```php
<span>
@error(inputsname)
{{$message}}
// or whatever you want!
@enderror
</span>
```

## Middlewares
It is a piece of code that can filter user requests 

**How to create a middleware ?**
```sh
php artisan make:middleware middlewarename
```

Global Middlewares: they are applied on all pages of the website at a single time.
Grouped Middlewares: they are applied on some specific pages
            'field_x'=>"option1 | option2",
Route Middleware: it is applied on a single route.
