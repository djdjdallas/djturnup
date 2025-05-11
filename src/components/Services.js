import styles from '../app/styles/Services.module.css';

const Services = () => {
  const services = [
    {
      title: 'WEDDINGS',
      description: 'Making your special day unforgettable with the perfect soundtrack',
      image: '/wedding-dj.jpg'
    },
    {
      title: 'CORPORATE EVENTS',
      description: 'Professional entertainment for company parties and business functions',
      image: '/corporate-dj.jpg'
    },
    {
      title: 'PRIVATE PARTIES',
      description: 'Customized playlists for birthday parties, anniversaries, and celebrations',
      image: '/private-party-dj.jpg'
    },
    {
      title: 'BAR/BAT MITZVAHS',
      description: 'Creating memorable experiences for these important milestones',
      image: '/mitzvah-dj.jpg'
    }
  ];

  return (
    <div id="services" className={styles.services}>
      <h2 className={styles.servicesTitle}>OUR SERVICES</h2>
      <div className={styles.servicesGrid}>
        {services.map((service, index) => (
          <div key={index} className={styles.serviceCard}>
            <div className={styles.serviceImage}>
              <img src={service.image} alt={service.title} />
            </div>
            <div className={styles.serviceContent}>
              <h3>{service.title}</h3>
              <p>{service.description}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Services;
