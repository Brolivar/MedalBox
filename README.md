# MedalBox

MedalBox is a simple app that showcases running achievements in the form of badges for completed challenges.

## Key Features & Design Considerations

- **Maintainability & Scalability**:  
  The app is designed with a focus on maintainability and scalability. While this approach adds a slight layer of complexity, it is intended to simulate a more realistic product structure, making the app easier to extend and manage in the future.

- **Architecture**:  
  The app follows a simplified version of the **MVVM** (Model-View-ViewModel) pattern for separating concerns between the UI and the data layer. Additionally, I implemented a basic **Coordinator** pattern to handle navigation, which isolates navigation logic and makes the app's flow more modular.

- **Data Simulation**:  
  Since there was no live API available, I created sample data using a JSON file. This allows the app to simulate a real-world scenario where data is fetched from an API, parsed, and presented in the UI. The app currently loads this static JSON data to replicate network requests.

- **Future Considerations**:  
  Since the app was pretty lightweight and there was not live API, caching and persistence were not implemented. However, should the app grow, integrating native persistence solutions like **UserDefaults** or **CoreData** would be beneficial for storing achievements. Additionally, using third-party libraries like **Kingfisher** for image caching would improve performance and user experience.

- **UI Implementation**:  
  I opted to use **storyboards** for the UI design, rather than implementing it programmatically. While the programmatic approach might be more suitable for collaborative team environments, storyboards provide a clear and visual way to structure the UI, which I found easier for the scope of this project.

## Conclusion

This app is a great starting point for displaying running achievements, and it can easily be extended with features like API integration, persistent storage, or enhanced UI. 

If you have any questions or encounter any issues, feel free to reach out!

