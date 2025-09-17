% -----------------------------
% Prolog program for a simple Web Blog (HTML demo)
% -----------------------------

% Blog title
blog_title("My AI & Prolog Blog").

% Blog posts: post(ID, Title, Content, Link)
post(1, "Welcome to My Blog", "This is my first blog post written using Prolog facts!", "https://example.com/post1").
post(2, "Learning Prolog", "Prolog is great for AI, logic programming, and reasoning systems.", "https://example.com/post2").
post(3, "HTML in Prolog", "We can simulate HTML tags like <a>, <title>, and <p>.", "https://example.com/post3").

% Generate HTML <title> tag
html_title :-
    blog_title(T),
    format("<title>~w</title>~n", [T]).

% Generate HTML <h1> tag
html_header :-
    blog_title(T),
    format("<h1>~w</h1>~n", [T]).

% Generate blog posts with <p> and <a>
html_posts :-
    post(ID, Title, Content, Link),
    format("<h2>~w</h2>~n", [Title]),
    format("<p>~w</p>~n", [Content]),
    format("<a href='~w'>Read More...</a><br><br>~n", [Link]),
    fail.
html_posts.

% Generate full blog page
generate_blog :-
    html_title,
    html_header,
    html_posts.
