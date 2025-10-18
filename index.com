
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa XYZ - Soluções Inovadoras para seu Negócio</title>
    <meta name="description" content="Há mais de 10 anos oferecendo soluções digitais completas para empresas. Consultoria, desenvolvimento web e marketing digital.">
    <style>
        /* Reset e estilos gerais */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        :root {
            --primary: #3498db;
            --primary-dark: #2980b9;
            --secondary: #2c3e50;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #34495e;
            --text: #333;
            --text-light: #7f8c8d;
            --shadow: 0 5px 15px rgba(0,0,0,0.1);
            --transition: all 0.3s ease;
        }
        
        body {
            color: var(--text);
            line-height: 1.6;
            overflow-x: hidden;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        .section-padding {
            padding: 80px 0;
        }
        
        /* Cabeçalho */
        header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: var(--transition);
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }
        
        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        
        .logo-icon {
            font-size: 28px;
            margin-right: 10px;
            color: var(--primary);
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: var(--secondary);
        }
        
        .logo-text span {
            color: var(--primary);
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 25px;
        }
        
        nav ul li a {
            text-decoration: none;
            color: var(--text);
            font-weight: 500;
            transition: var(--transition);
            position: relative;
        }
        
        nav ul li a:hover {
            color: var(--primary);
        }
        
        nav ul li a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--primary);
            transition: var(--transition);
        }
        
        nav ul li a:hover::after {
            width: 100%;
        }
        
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--secondary);
        }
        
        /* Banner */
        .banner {
            background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(44, 62, 80, 0.9)), url('https://images.unsplash.com/photo-1497366754035-f200968a6e72?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
            color: white;
            text-align: center;
            padding: 150px 20px;
            position: relative;
        }
        
        .banner h1 {
            font-size: 3rem;
            margin-bottom: 20px;
            animation: fadeInDown 1s;
        }
        
        .banner p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
            animation: fadeInUp 1s;
        }
        
        .btn {
            display: inline-block;
            background-color: var(--primary);
            color: white;
            padding: 12px 30px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }
        
        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .btn-secondary {
            background-color: transparent;
            border: 2px solid white;
            margin-left: 15px;
        }
        
        .btn-secondary:hover {
            background-color: white;
            color: var(--secondary);
        }
        
        /* Seção de serviços */
        .services {
            background-color: #f9f9f9;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .section-title h2 {
            font-size: 2.2rem;
            color: var(--secondary);
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--primary);
        }
        
        .section-title p {
            color: var(--text-light);
            max-width: 600px;
            margin: 20px auto 0;
        }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .service-card {
            background-color: white;
            border-radius: 8px;
            padding: 40px 30px;
            box-shadow: var(--shadow);
            transition: var(--transition);
            text-align: center;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 0;
            background-color: var(--primary);
            transition: var(--transition);
            z-index: -1;
        }
        
        .service-card:hover::before {
            height: 100%;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            color: white;
        }
        
        .service-card:hover h3,
        .service-card:hover p {
            color: white;
        }
        
        .service-icon {
            font-size: 50px;
            color: var(--primary);
            margin-bottom: 20px;
            transition: var(--transition);
        }
        
        .service-card:hover .service-icon {
            color: white;
            transform: scale(1.1);
        }
        
        .service-card h3 {
            margin-bottom: 15px;
            color: var(--secondary);
            transition: var(--transition);
        }
        
        .service-card p {
            color: var(--text-light);
            transition: var(--transition);
        }
        
        /* Seção sobre */
        .about-content {
            display: flex;
            align-items: center;
            gap: 50px;
        }
        
        .about-text {
            flex: 1;
        }
        
        .about-text h2 {
            font-size: 2.2rem;
            color: var(--secondary);
            margin-bottom: 20px;
        }
        
        .about-text p {
            margin-bottom: 20px;
            color: #555;
        }
        
        .about-features {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin: 30px 0;
        }
        
        .about-feature {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .about-feature i {
            color: var(--primary);
            margin-right: 10px;
            font-size: 1.2rem;
        }
        
        .about-image {
            flex: 1;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--shadow);
            position: relative;
        }
        
        .about-image img {
            width: 100%;
            height: auto;
            display: block;
            transition: var(--transition);
        }
        
        .about-image:hover img {
            transform: scale(1.05);
        }
        
        /* Seção de depoimentos */
        .testimonials {
            background-color: #f9f9f9;
        }
        
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .testimonial-card {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: var(--shadow);
            position: relative;
        }
        
        .testimonial-card::before {
            content: '"';
            position: absolute;
            top: 10px;
            left: 20px;
            font-size: 60px;
            color: var(--primary);
            opacity: 0.2;
            font-family: Georgia, serif;
        }
        
        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            color: #555;
            position: relative;
            z-index: 1;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
        }
        
        .author-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 15px;
        }
        
        .author-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .author-info h4 {
            color: var(--secondary);
            margin-bottom: 5px;
        }
        
        .author-info p {
            color: var(--text-light);
            font-size: 0.9rem;
        }
        
        /* Seção de números */
        .numbers {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            text-align: center;
        }
        
        .numbers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
        }
        
        .number-item h3 {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        
        .number-item p {
            font-size: 1.1rem;
        }
        
        /* Seção de clientes */
        .clients {
            background-color: white;
        }
        
        .clients-grid {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
        }
        
        .client-logo {
            opacity: 0.6;
            transition: var(--transition);
            filter: grayscale(100%);
        }
        
        .client-logo:hover {
            opacity: 1;
            filter: grayscale(0%);
        }
        
        .client-logo img {
            max-height: 60px;
            width: auto;
        }
        
        /* Seção de FAQ */
        .faq-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .faq-item {
            margin-bottom: 20px;
            border: 1px solid #eaeaea;
            border-radius: 8px;
            overflow: hidden;
            transition: var(--transition);
        }
        
        .faq-item:hover {
            box-shadow: var(--shadow);
        }
        
        .faq-question {
            padding: 20px;
            background-color: #f9f9f9;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
            color: var(--secondary);
            transition: var(--transition);
        }
        
        .faq-question:hover {
            background-color: var(--light);
        }
        
        .faq-question::after {
            content: '+';
            font-size: 1.5rem;
            transition: var(--transition);
        }
        
        .faq-answer {
            padding: 0 20px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease, padding 0.3s ease;
        }
        
        .faq-item.active .faq-answer {
            padding: 20px;
            max-height: 500px;
        }
        
        .faq-item.active .faq-question {
            background-color: var(--primary);
            color: white;
        }
        
        .faq-item.active .faq-question::after {
            content: '-';
            transform: rotate(180deg);
        }
        
        /* Seção de CTA */
        .cta {
            background: linear-gradient(rgba(44, 62, 80, 0.9), rgba(44, 62, 80, 0.9)), url('https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
            color: white;
            text-align: center;
            padding: 100px 20px;
        }
        
        .cta h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        
        .cta p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
        }
        
        /* Seção de contato */
        .contact {
            background-color: #f9f9f9;
        }
        
        .contact-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 50px;
        }
        
        .contact-info h3 {
            color: var(--secondary);
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
        
        .contact-details {
            margin-bottom: 30px;
        }
        
        .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        
        .contact-icon {
            color: var(--primary);
            margin-right: 15px;
            font-size: 1.2rem;
            margin-top: 5px;
        }
        
        .contact-form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: var(--shadow);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--secondary);
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: var(--transition);
        }
        
        .form-control:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }
        
        /* Rodapé */
        footer {
            background-color: var(--secondary);
            color: white;
            padding: 60px 0 30px;
        }
        
        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }
        
        .footer-column h3 {
            margin-bottom: 20px;
            font-size: 1.3rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-column h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 2px;
            background-color: var(--primary);
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 10px;
        }
        
        .footer-column ul li a {
            color: #bdc3c7;
            text-decoration: none;
            transition: var(--transition);
        }
        
        .footer-column ul li a:hover {
            color: white;
            padding-left: 5px;
        }
        
        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        
        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255,255,255,0.1);
            border-radius: 50%;
            color: white;
            text-decoration: none;
            transition: var(--transition);
        }
        
        .social-links a:hover {
            background-color: var(--primary);
            transform: translateY(-3px);
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid #34495e;
            color: #bdc3c7;
            font-size: 0.9rem;
        }
        
        /* Animações */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s, transform 0.6s;
        }
        
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        /* Responsividade */
        @media (max-width: 992px) {
            .banner h1 {
                font-size: 2.5rem;
            }
            
            .about-content {
                flex-direction: column;
            }
        }
        
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                padding: 15px 0;
            }
            
            nav {
                width: 100%;
                margin-top: 15px;
                display: none;
            }
            
            nav.active {
                display: block;
            }
            
            nav ul {
                flex-direction: column;
                width: 100%;
            }
            
            nav ul li {
                margin: 0;
                text-align: center;
                border-bottom: 1px solid #eee;
            }
            
            nav ul li a {
                display: block;
                padding: 10px 0;
            }
            
            .mobile-menu-btn {
                display: block;
                position: absolute;
                right: 20px;
                top: 15px;
            }
            
            .banner {
                padding: 100px 20px;
            }
            
            .banner h1 {
                font-size: 2rem;
            }
            
            .btn-group {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
            
            .btn-secondary {
                margin-left: 0;
            }
        }
        
        @media (max-width: 576px) {
            .section-padding {
                padding: 60px 0;
            }
            
            .banner {
                padding: 80px 20px;
            }
            
            .service-card {
                padding: 30px 20px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Cabeçalho -->
    <header>
        <div class="container header-container">
            <a href="#" class="logo">
                <div class="logo-icon">
                    <i class="fas fa-rocket"></i>
                </div>
                <div class="logo-text">Empresa<span>XYZ</span></div>
            </a>
            <button class="mobile-menu-btn" id="mobileMenuBtn">
                <i class="fas fa-bars"></i>
            </button>
            <nav id="mainNav">
                <ul>
                    <li><a href="#home">Início</a></li>
                    <li><a href="#services">Serviços</a></li>
                    <li><a href="#about">Sobre</a></li>
                    <li><a href="#testimonials">Depoimentos</a></li>
                    <li><a href="#faq">FAQ</a></li>
                    <li><a href="#contact">Contato</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Banner Principal -->
    <section class="banner" id="home">
        <div class="container">
            <h1>Soluções Inovadoras para o Seu Negócio</h1>
            <p>Oferecemos serviços de alta qualidade que impulsionam resultados e transformam empresas. Mais de 10 anos de experiência no mercado.</p>
            <div class="btn-group">
                <a href="#contact" class="btn">Entre em Contato</a>
                <a href="#services" class="btn btn-secondary">Nossos Serviços</a>
            </div>
        </div>
    </section>

    <!-- Seção de Serviços -->
    <section class="services section-padding" id="services">
        <div class="container">
            <div class="section-title">
                <h2>Nossos Serviços</h2>
                <p>Conheça nossas soluções especializadas para atender às suas necessidades</p>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Consultoria Estratégica</h3>
                    <p>Desenvolvemos estratégias personalizadas para otimizar seus processos e maximizar resultados com base em dados e análise de mercado.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-laptop-code"></i>
                    </div>
                    <h3>Desenvolvimento Web</h3>
                    <p>Criamos sites e aplicações web modernas, responsivas e de alto desempenho utilizando as melhores tecnologias do mercado.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-bullhorn"></i>
                    </div>
                    <h3>Marketing Digital</h3>
                    <p>Estratégias de marketing digital para aumentar sua visibilidade, engajamento e conversões através de múltiplos canais.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Seção Sobre -->
    <section class="about section-padding" id="about">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2>Sobre Nossa Empresa</h2>
                    <p>Com mais de 10 anos de experiência no mercado, a Empresa XYZ se consolidou como referência em soluções inovadoras para empresas de todos os portes.</p>
                    <p>Nossa missão é transformar desafios em oportunidades, oferecendo serviços de alta qualidade que impulsionam o crescimento sustentável dos nossos clientes.</p>
                    
                    <div class="about-features">
                        <div class="about-feature">
                            <i class="fas fa-check-circle"></i>
                            <span>Equipe especializada e certificada</span>
                        </div>
                        <div class="about-feature">
                            <i class="fas fa-check-circle"></i>
                            <span>Metodologias ágeis e comprovadas</span>
                        </div>
                        <div class="about-feature">
                            <i class="fas fa-check-circle"></i>
                            <span>Suporte contínuo e personalizado</span>
                        </div>
                        <div class="about-feature">
                            <i class="fas fa-check-circle"></i>
                            <span>Tecnologias de ponta e inovação</span>
                        </div>
                    </div>
                    
                    <a href="#contact" class="btn">Saiba Mais</a>
                </div>
                <div class="about-image">
                    <img src="https://images.unsplash.com/photo-1521737711867-e3b97375f902?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80" alt="Nossa equipe de trabalho">
                </div>
            </div>
        </div>
    </section>

    <!-- Seção de Depoimentos -->
    <section class="testimonials section-padding" id="testimonials">
        <div class="container">
            <div class="section-title">
                <h2>O Que Nossos Clientes Dizem</h2>
                <p>Confira alguns depoimentos de quem já experimentou nossos serviços</p>
            </div>
            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "A Empresa XYZ transformou completamente nossa presença digital. Em apenas 3 meses, nossas vendas online aumentaram 150%. A equipe foi extremamente profissional e atenciosa em todas as etapas do projeto."
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Maria Silva">
                        </div>
                        <div class="author-info">
                            <h4>Maria Silva</h4>
                            <p>Diretora de Marketing</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "O trabalho da equipe foi excepcional. Entenderam perfeitamente nossas necessidades e entregaram resultados além do esperado. A comunicação foi clara e o projeto foi concluído dentro do prazo e orçamento."
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="João Santos">
                        </div>
                        <div class="author-info">
                            <h4>João Santos</h4>
                            <p>CEO da Empresa ABC</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "Profissionais extremamente competentes e dedicados. Recomendo a todos que buscam qualidade e resultados concretos. O suporte pós-entrega também é excelente, sempre disponíveis para ajustes e melhorias."
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Ana Oliveira">
                        </div>
                        <div class="author-info">
                            <h4>Ana Oliveira</h4>
                            <p>Gerente de Projetos</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Seção de Números -->
    <section class="numbers section-padding">
        <div class="container">
            <div class="numbers-grid">
                <div class="number-item">
                    <h3>500+</h3>
                    <p>Projetos Concluídos</p>
                </div>
                <div class="number-item">
                    <h3>150+</h3>
                    <p>Clientes Satisfeitos</p>
                </div>
                <div class="number-item">
                    <h3>10+</h3>
                    <p>Anos de Experiência</p>
                </div>
                <div class="number-item">
                    <h3>25+</h3>
                    <p>Prêmios Recebidos</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Seção de Clientes -->
    <section class="clients section-padding">
        <div class="container">
            <div class="section-title">
                <h2>Nossos Clientes</h2>
                <p>Trabalhamos com empresas de todos os tamanhos e segmentos</p>
            </div>
            <div class="clients-grid">
                <div class="client-logo">
                    <img src="https://via.placeholder.com/150x60/2c3e50/ffffff?text=Cliente+1" alt="Cliente 1">
                </div>
                <div class="client-logo">
                    <img src="https://via.placeholder.com/150x60/2c3e50/ffffff?text=Cliente+2" alt="Cliente 2">
                </div>
                <div class="client-logo">
                    <img src="https://via.placeholder.com/150x60/2c3e50/ffffff?text=Cliente+3" alt="Cliente 3">
                </div>
                <div class="client-logo">
                    <img src="https://via.placeholder.com/150x60/2c3e50/ffffff?text=Cliente+4" alt="Cliente 4">
                </div>
                <div class="client-logo">
                    <img src="https://via.placeholder.com/150x60/2c3e50/ffffff?text=Cliente+5" alt="Cliente 5">
                </div>
            </div>
        </div>
    </section>

    <!-- Seção de FAQ -->
    <section class="faq section-padding" id="faq">
        <div class="container">
            <div class="section-title">
                <h2>Perguntas Frequentes</h2>
                <p>Tire suas dúvidas sobre nossos serviços e processos</p>
            </div>
            <div class="faq-container">
                <div class="faq-item">
                    <div class="faq-question">Quais são as formas de pagamento aceitas?</div>
                    <div class="faq-answer">
                        <p>Aceitamos diversas formas de pagamento, incluindo cartão de crédito (em até 12x), boleto bancário, PIX e transferência bancária. Para projetos de maior valor, também oferecemos condições especiais de parcelamento.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">Qual é o prazo médio para entrega de um projeto?</div>
                    <div class="faq-answer">
                        <p>O prazo varia de acordo com a complexidade do projeto. Sites institucionais simples podem ser entregues em 15 a 30 dias, enquanto projetos mais complexos, como e-commerces ou sistemas personalizados, podem levar de 2 a 4 meses. Durante o briefing, apresentamos um cronograma detalhado com todas as etapas e prazos.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">Vocês oferecem suporte após a entrega do projeto?</div>
                    <div class="faq-answer">
                        <p>Sim, oferecemos diferentes planos de suporte e manutenção conforme a necessidade de cada cliente. Todos os projetos incluem 30 dias de suporte gratuito após a entrega. Após esse período, podemos contratar planos mensais ou anuais de manutenção.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">Como é o processo de desenvolvimento de um projeto?</div>
                    <div class="faq-answer">
                        <p>Nosso processo é dividido em etapas: 1) Briefing e entendimento das necessidades; 2) Planejamento e proposta; 3) Design e prototipagem; 4) Desenvolvimento; 5) Testes e ajustes; 6) Lançamento; 7) Suporte pós-entrega. Mantemos o cliente envolvido em todas as etapas com reuniões regulares de acompanhamento.</p>
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">Vocês trabalham com empresas de qualquer tamanho?</div>
                    <div class="faq-answer">
                        <p>Sim, atendemos desde startups e pequenas empresas até grandes corporações. Desenvolvemos soluções escaláveis que crescem junto com o seu negócio, sempre adequando a complexidade e o investimento ao perfil de cada cliente.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Seção de CTA -->
    <section class="cta section-padding">
        <div class="container">
            <h2>Pronto para transformar seu negócio?</h2>
            <p>Entre em contato conosco e descubra como podemos ajudar a alcançar seus objetivos</p>
            <a href="#contact" class="btn">Solicitar Orçamento</a>
        </div>
    </section>

    <!-- Seção de Contato -->
    <section class="contact section-padding" id="contact">
        <div class="container">
            <div class="section-title">
                <h2>Entre em Contato</h2>
                <p>Estamos aqui para responder suas perguntas e ouvir suas ideias</p>
            </div>
            <div class="contact-container">
                <div class="contact-info">
                    <h3>Fale Conosco</h3>
                    <p>Entre em contato conosco através dos canais abaixo ou preencha o formulário ao lado.</p>
                    
                    <div class="contact-details">
                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div>
                                <h4>Endereço</h4>
                                <p>Av. Paulista, 1000 - São Paulo, SP</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div>
                                <h4>Telefone</h4>
                                <p>(11) 9999-9999</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div>
                                <h4>E-mail</h4>
                                <p>contato@empresaxyz.com.br</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <h4>Horário de Atendimento</h4>
                                <p>Segunda a Sexta: 9h às 18h</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                    </div>
                </div>
                
                <div class="contact-form">
                    <form id="contactForm">
                        <div class="form-group">
                            <label for="name">Nome Completo</label>
                            <input type="text" id="name" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <input type="email" id="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Telefone</label>
                            <input type="tel" id="phone" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="subject">Assunto</label>
                            <input type="text" id="subject" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Mensagem</label>
                            <textarea id="message" class="form-control" required></textarea>
                        </div>
                        <button type="submit" class="btn">Enviar Mensagem</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Rodapé -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-column">
                    <h3>Empresa XYZ</h3>
                    <p>Há mais de 10 anos oferecendo soluções digitais completas para empresas de todos os portes.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-whatsapp"></i></a>
                    </div>
                </div>
                <div class="footer-column">
                    <h3>Links Rápidos</h3>
                    <ul>
                        <li><a href="#home">Início</a></li>
                        <li><a href="#services">Serviços</a></li>
                        <li><a href="#about">Sobre Nós</a></li>
                        <li><a href="#testimonials">Depoimentos</a></li>
                        <li><a href="#faq">FAQ</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Serviços</h3>
                    <ul>
                        <li><a href="#">Consultoria Estratégica</a></li>
                        <li><a href="#">Desenvolvimento Web</a></li>
                        <li><a href="#">Marketing Digital</a></li>
                        <li><a href="#">Design UI/UX</a></li>
                        <li><a href="#">SEO e Analytics</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Contato</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt"></i> Av. Paulista, 1000 - São Paulo, SP</li>
                        <li><i class="fas fa-phone"></i> (11) 9999-9999</li>
                        <li><i class="fas fa-envelope"></i> contato@empresaxyz.com.br</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2023 Empresa XYZ. Todos os direitos reservados.</p>
            </div>
        </div>
    </footer>

    <script>
        // Menu mobile
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const mainNav = document.getElementById('mainNav');
        
        mobileMenuBtn.addEventListener('click', () => {
            mainNav.classList.toggle('active');
            mobileMenuBtn.innerHTML = mainNav.classList.contains('active') ? 
                '<i class="fas fa-times"></i>' : '<i class="fas fa-bars"></i>';
        });
        
        // FAQ Accordion
        const faqItems = document.querySelectorAll('.faq-item');
        
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            
            question.addEventListener('click', () => {
                // Fecha todos os outros itens
                faqItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                    }
                });
                
                // Abre/fecha o item atual
                item.classList.toggle('active');
            });
        });
        
        // Form submission
        const contactForm = document.getElementById('contactForm');
        
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            alert('Mensagem enviada com sucesso! Entraremos em contato em breve.');
            contactForm.reset();
        });
        
        // Scroll animations
        const fadeElements = document.querySelectorAll('.service-card, .testimonial-card, .faq-item, .about-content, .numbers-grid');
        
        const fadeInOnScroll = () => {
            fadeElements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.classList.add('visible');
                }
            });
        };
        
        // Verifica na carga inicial
        window.addEventListener('load', fadeInOnScroll);
        // Verifica durante o scroll
        window.addEventListener('scroll', fadeInOnScroll);
        
        // Smooth scrolling para links internos
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                if (targetId === '#') return;
                
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 80,
                        behavior: 'smooth'
                    });
                    
                    // Fecha o menu mobile se estiver aberto
                    if (mainNav.classList.contains('active')) {
                        mainNav.classList.remove('active');
                        mobileMenuBtn.innerHTML = '<i class="fas fa-bars"></i>';
                    }
                }
            });
        });
        
        // Header scroll effect
        window.addEventListener('scroll', () => {
            if (window.scrollY > 100) {
                document.querySelector('header').style.boxShadow = '0 5px 20px rgba(0,0,0,0.1)';
            } else {
                document.querySelector('header').style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
            }
        });
    </script>
</body>
</html>
