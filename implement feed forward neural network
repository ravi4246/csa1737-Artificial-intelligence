import numpy as np

class NeuralNetwork:
    def __init__(self, input_size, hidden_size, output_size):
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        
        # Initialize weights and biases
        self.weights_input_hidden = np.random.randn(self.input_size, self.hidden_size)
        self.bias_input_hidden = np.zeros((1, self.hidden_size))
        
        self.weights_hidden_output = np.random.randn(self.hidden_size, self.output_size)
        self.bias_hidden_output = np.zeros((1, self.output_size))
        
    def sigmoid(self, x):
        return 1 / (1 + np.exp(-x))
    
    def forward(self, X):
        # Input to hidden layer
        self.hidden_input = np.dot(X, self.weights_input_hidden) + self.bias_input_hidden
        self.hidden_output = self.sigmoid(self.hidden_input)
        
        # Hidden to output layer
        self.output_input = np.dot(self.hidden_output, self.weights_hidden_output) + self.bias_hidden_output
        self.predicted_output = self.sigmoid(self.output_input)
        
        return self.predicted_output
    
    def sigmoid_derivative(self, x):
        return x * (1 - x)
    
    def backward(self, X, y, output):
        # Calculate gradients
        delta_output = (y - output) * self.sigmoid_derivative(output)
        delta_hidden = delta_output.dot(self.weights_hidden_output.T) * self.sigmoid_derivative(self.hidden_output)
        
        # Update weights and biases
        self.weights_hidden_output += self.hidden_output.T.dot(delta_output)
        self.bias_hidden_output += np.sum(delta_output, axis=0, keepdims=True)
        
        self.weights_input_hidden += X.T.dot(delta_hidden)
        self.bias_input_hidden += np.sum(delta_hidden, axis=0, keepdims=True)
    
    def train(self, X, y, epochs):
        for epoch in range(epochs):
            output = self.forward(X)
            self.backward(X, y, output)
    
    def predict(self, X):
        return np.round(self.forward(X))

# Example usage
if __name__ == "__main__":
    # Example dataset (binary classification)
    X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
    y = np.array([[0], [1], [1], [0]])
    
    # Initialize and train the neural network
    nn = NeuralNetwork(input_size=2, hidden_size=4, output_size=1)
    nn.train(X, y, epochs=10000)
    
    # Predict on new data
    predictions = nn.predict(X)
    print("Predictions:")
    print(predictions)
