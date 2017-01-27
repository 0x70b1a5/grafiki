class NavBar extends React.Component {
  render () {
    var login_sensitive_1 = this.props.username ?
      <Button text={this.props.username} theme={"dark"} />
      : <Button url={"/users/sign_in"} text={"Login"} theme={"light"} />
    var login_sensitive_2 = this.props.username ?
      <Button url={"/logout"} text={"Sign out"} theme={"light"} />
      : <Button url={"/users/sign_up"} text={"Register"} theme={"dark"} />
    return (
      <div className="nav">
        <Button theme="dark" url="/">
          <img id="logo" src="/assets/textlogo.svg"/>
        </Button>
        <Button url={"/bounties/new"} text={"post a bounty"} theme={"light"} />
        <Button url={"/bounties"} text={"browse bounties"} theme={"light"} />
        <Button url={"/bounties/upload"} text={"post art"} theme={"light"} />
        <Button url={"/bounties/filled"} text={"browse art"} theme={"light"} />
        <Button url={"/pages/about"} text={"about"} theme={"light"} />
        {login_sensitive_1}
        {login_sensitive_2}
        {this.props.children}
      </div>
    );
  }
}
