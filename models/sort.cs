public string TitleSort { get; set; }
public string DateSort { get; set; }

public async Task OnGetAsync(string sortOrder)
{
    TitleSort = String.IsNullOrEmpty(sortOrder) ? "title_desc" : "";
    DateSort = sortOrder == "Date" ? "date_desc" : "Date";

    var movies = from m in _context.Movies select m;

    switch (sortOrder)
    {
        case "title_desc":
            movies = movies.OrderByDescending(s => s.Title);
            break;
        case "Date":
            movies = movies.OrderBy(s => s.ReleaseDate);
            break;
        case "date_desc":
            movies = movies.OrderByDescending(s => s.ReleaseDate);
            break;
        default:
            movies = movies.OrderBy(s => s.Title);
            break;
    }

    Movie = await movies.AsNoTracking().ToListAsync();
}
