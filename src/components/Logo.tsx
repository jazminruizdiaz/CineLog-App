import logoImage from "../asset/cinelog.png";

const Logo = () => {
  return (
    <div className="logo">
      <img src={logoImage} alt="cineLog logo" className="logo__image" />
      <img src="./" alt="" />
    </div>
  );
};

export default Logo;
