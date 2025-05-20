import styles from "../app/styles/Features.module.css";

const Features = () => {
  const features = [
    {
      title: "Elite Talent",
      description:
        "Professional DJs with extensive experience in Los Angeles entertainment scene",
      icon: "⭐",
    },
    {
      title: "Pro Setup & Execution",
      description:
        "High-quality sound and interactive performance that keeps your guests entertained",
      icon: "⚙️",
    },
    {
      title: "DJs for Any Occasion",
      description:
        "Whether it's a wedding day, corporate gala, or birthday party, we have the perfect DJ",
      icon: "🎵",
    },
    {
      title: "Custom Playlists",
      description:
        "From hip-hop to EDM to Top 40 hits, we play all the songs you want to hear",
      icon: "🎧",
    },
  ];

  return (
    <div id="about" className={styles.features}>
      <h2 className={styles.featuresTitle}>Why Choose Mobile DJ LA?</h2>
      <div className={styles.featuresGrid}>
        {features.map((feature, index) => (
          <div key={index} className={styles.featureCard}>
            <div className={styles.featureIcon}>{feature.icon}</div>
            <h3>{feature.title}</h3>
            <p>{feature.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Features;
