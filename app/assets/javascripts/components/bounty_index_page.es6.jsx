class BountyIndexPage extends React.Component {
  render () {
    var searchBox = (
      <div>
        <form action={this.props.route} acceptCharset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓"/>
          <input type="text" name="search" className="normalize-input" id="pac-input" placeholder=" search in title, description..." style={{position: "relative"}}/>
          <input type="submit" value="search" className="light button" data-disable-with="search"/>
        </form>
      </div>
    )
    if (this.props.bounties.length == 0) {
      return (
        <div>
          {searchBox}
          <Button
            text="Search returned no results."
            theme="light" />
        </div>
      )
    }
    return (
      <div>
        {searchBox}
        <PaginatorButtons
          paginator={this.props.paginator}
          limit={this.props.limit}
          items={this.props.items}
          route={this.props.route}
          theme={"light"} />
        <BountiesList bounties={this.props.bounties} />
        <PaginatorButtons
          paginator={this.props.paginator}
          limit={this.props.limit}
          items={this.props.items}
          route={this.props.route}
          theme={"light"} />
      </div>
    )
  }
}
