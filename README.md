<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1>Triple S Project</h1>
<p>
  <strong>Triple S Project</strong> is a mobile application platform that facilitates and manages the processes of shipping and delivering light products in a sustainable and smart way. The project aims to ensure the greatest possible resource saving by utilizing wasted resources in transporting individuals to transport goods in a way that does not conflict with the transportation of individuals.
</p>
<h2>Application Run</h2>

https://github.com/EngAbdoS/Smart-Shipment-System/assets/86132875/5ed83109-ec93-4eb1-acf7-4d05f83c686a

<h2>Project Architecture</h2>
<p>The project follows a clean architecture approach and is divided into four layers:</p>

<h3>Application Layer</h3>
<ul>
  <li><code>MyApp</code> class</li>
  <li>App constants</li>
  <li>App preferences</li>
  <li>App service locator</li>
  <li>Global functions</li>
</ul>

<h3>Data Layer</h3>
<p>This layer consists of:</p>
<ul>
  <li>Data Source Layer
    <ul>
      <li>Cache data source</li>
      <li>Local data source</li>
      <li>Remote data source (depends on Application Service Client and Firebase Storage as a CDN for any images)</li>
    </ul>
  </li>
  <li>Response classes layer</li>
  <li>Mappers layer (converts endpoint responses to object models)</li>
  <li>Network layer
    <ul>
      <li>Endpoints request classes</li>
      <li>AppServiceClient (contains RESTful client endpoints)</li>
      <li>dio_factory (creates the HTTP request)</li>
      <li>Failure class and global error handler</li>
    </ul>
  </li>
  <li>Application Repository Implementation</li>
</ul>

<h3>Domain Layer</h3>
<p>This layer contains:</p>
<ul>
  <li>App entities</li>
  <li>Models</li>
  <li>Repository abstract class</li>
  <li>Use cases</li>
</ul>

<h3>Presentation Layer</h3>
<p>This layer is responsible for:</p>
<ul>
  <li>Full localization</li>
  <li>Theme management based on localization</li>
  <li>Color management</li>
  <li>Assets management</li>
  <li>Font management</li>
  <li>Language management</li>
  <li>Page transition management</li>
  <li>Router management</li>
  <li>Strings management</li>
  <li>Styles management</li>
  <li>Values management</li>
  <li>Global status management by GlobalLoaderOverlay dependency</li>
</ul>

<h2>Development Highlights</h2>
<ul>
  <li>Developed a Flutter mobile application to meet the needs of both customers and intermediaries.</li>
  <li>Followed Clean Architecture principles to ensure modularization, scalability, and maintainability for future feature implementations.</li>
  <li>Utilized Stream Controllers to manage state effectively, ensuring responsive and real-time updates within the application.</li>
  <li>Implemented the MVVM (Model-View-ViewModel) architectural pattern to separate the UI from the business logic, enhancing the maintainability and scalability of the codebase.</li>
  <li>Leveraged hierarchical inheritance to promote code reuse and simplify the development process by creating base classes with common functionality and deriving specific classes for specialized behaviors.</li>
  <li>Backend integration defining RESTful APIs and Firebase storage as a CDN.</li>
  <li>Implemented features such as localization, theming, responsiveness, real-time user input validation, animations, runtime caching, shared preferences, secure encrypted storage, and service locator for dependencies injection and module initialization/reinitialization.</li>
</ul>

<h2>License</h2>
<p>This project is licensed under the MIT License - see the LICENSE file for details.</p>

</body>
</html>
