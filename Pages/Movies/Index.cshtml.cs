public IList<Movie> Movie { get; set; } = default!;

[BindProperty(SupportsGet = true)]
public string? SearchString { get; set; }

public async Task OnGetAsync()
{
    var movies = from m in _context.Movies
                 select m;

    if (!string.IsNullOrEmpty(SearchString))
    {
        movies = movies.Where(s => s.Title!.Contains(SearchString));
    }

    Movie = await movies.ToListAsync();
}


And in Index.cshtml add:

<form method="get">
    <p>
        Title: <input type="text" name="SearchString" />
        <input type="submit" value="Search" />
    </p>
</form>
