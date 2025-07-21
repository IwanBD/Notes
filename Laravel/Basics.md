# Introduction to Artisan
**artisan** is a command line tool used to manage projects in Laravel. It embeds features such as:
- generate code
- manage migrations
- clearing cache
- etc
## Creation of the project
```sh
composer create-project laravel/laravel <project_name>
```

## Launch the project
```sh
php artisan serve # make sure to navigate to the project before
```

## Get information about the project
```sh
php artisan about
```

## Get list of commands in artisan
```sh
php artisan list
```

## Get help about a command
```sh
php artisan <command_name> help
php artisan <command_name:option> --help
```

## Directory Structure
- `app`:  Mainly contains models and controllers
- `bootstrap`: focuses on configuration of middlewares and routings
- `config`: configuration files of the app
- `database`: factories, migrations and seeders (and maybe sqlite database)
- `public`: single web access folder. I contains `.htacess` file for apache server configuration of the project, `favicon` and `index.php`
- `resources`: contains css, js and models
- `routes`: contains main routes of the application (including APIs)
- `storage`: generated files are located here (cache, sessions, testings ...)
- `tests`: folder for tests
- `vendor`: packages required for the app
- `.editorconfig`: editor configurations
- `.env`:  different development environments configurations (should never be pushed to github)
- `.env.example`:  simple .env exemple

## Creation of a simple page (Manually)
**Creation of a new route in `routes/wep.php`**
```php
Route::get("page_name", function()
{
	return view("page_name")
});
```
**Creation of the page in `views/page_name.blade.php`**

## Configuration files
Most of configurations files are stored in the `.env` file. In the `config` folderl, each configuration could be extracted from the `.env` in order to be used in our project.
To publish or add a new configuration that is not existing in our config folder, we have to di so:
```sh
php artisan config:publish # then choose the configurations we want to add
```

## Debugging
- `dump`:  php fonction for pretty-debugging
- `dd`: die and dump

## Routing requests
Avaiable routing methods:
- `Route::get($uri, $callback)`
- `Route::post($uri, $callback)`
- `Route::put($uri, $callback)`
- `Route::patch($uri, $callback)`
- `Route::delete($uri, $callback)`
- `Route::options($uri, $callback)`
- `Route::match([method1, method2], $uri, $callback)`
- `Route::redirect($uri, $target)`
```php
Route::view($uri, $view_name);
# is the same as
Route::get($uri, function()
{
	return view($view_name);
});
```

## Route Required Parameters
```php
Route::get($uri."/{param}", function($param)
{
	return view($page_name, [$param_name=>$param]);
});
```

e.g:
```php
Route::get("{lang}/product/{id}/review/{review_id}",
function(string $lang, string $id, string $review_id)
{
	// statements
}
);
```
## Route Optional Parameters
```php
Route::method($uri."/{param?}", function($param=null)
{
    return "";
});
```
e.g:
```php
Route::get("/product/{category?}", function($category=null)
{
    return "Peoduct for category=$category";
});
```
## Route Parameter Validation
Usefull to control url parameters.
```php
Route::method($uri."/{param?}", function($param)
{
	//statements when everything is ok
})->whereType("param")
```
e.g:
```php
Route::get("/product/{id}", function(string $id)
{
    return "Works! $id";
})->whereNumber('id'); # will work only if id is a number
```

```php
Route::get("/user/{username}", function(string $username)
{
	// statements
})->whereAlphanumeric("username");
```

```php
Route::get("{lang}/product/{id}/review/{review_id}",
function(string $lang, string $id, string $review_id)
    {
        $data = ["lang"=>$lang, "review"=> $review_id, "product"=>$id];
        dump($data);
    }
)->whereAlpha("lang) //only letters
-whereNumber("id")// only digits
;
```

```php
Route::get("{lang}/products", function(string $lang)
{
	// statements
}
)->whereIn("lang", ["en", "ka", "in"]);
```

## Route with Regex
```php
Route::method("$uri/{param}", $callback)->where("param", "regexp");
#or
Route::method("$uri/{param}", $callback)->where(["param"=>"regexp"]);
```
e.g:
```php
Route::get("/user/{username}", function(string $username)
{
    return "Welcome $username";    
})->where("username", '[a-z]+'); // only lower case caracters
```

## Named route
They are usefull to keep the name of the route in a single place, so that modifications become centralised
```php
Route::view($uri, $page_name)->name($page_name)
```

```php
Route::view("/about", "about")->name("about");
Route::get("/", function()
{
    $aboutPageUrl = route("about"); // fetches the name of the url
    dd($aboutPageUrl);
});
```