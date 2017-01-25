class NavBar extends React.Component {
  render () {
    return (
      <div className="nav">
        <Button theme="dark" url="/">
          <img id="logo" src="/assets/textlogo.svg"/>
        </Button>
        <Button url={"/bounties/new"} text={"post a bounty"} theme={"light"} />
        <Button url={"/bounties"} text={"browse bounties"} theme={"light"} />
        <Button url={"/bounties/upload"} text={"post art"} theme={"light"} />
        <Button url={"/bounties/filled"} text={"browse art"} theme={"light"} />
        <Button url={"/about"} text={"about"} theme={"light"} />
        <Button url={"/users/sign_in"} text={"login"} theme={"light"} />
        <Button url={"/users/sign_up"} text={"register"} theme={"dark"} />
        {this.props.children}
      </div>
    );
  }
}
