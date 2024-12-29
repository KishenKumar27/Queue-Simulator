# Queue Simulator

## Overview
The Queue Simulator is a system designed to simulate customer arrivals at a service center, where customers' temperatures, arrival times, and service times are randomly generated. The simulation tracks customer movements within the center, calculates waiting times, and evaluates the performance of the service center based on various metrics.

## Project Structure

- **365660_Coding Assignment T2_2020.pdf**: Assignment instructions and guidelines.
- **MainScreen.m**: Main code for simulating the queue system.
- **README.md**: This file, providing an overview of the project.
- **Report.pdf**: The detailed report, including the simulation results, flowchart, and explanations of important source codes.
- **randomizer.m**: Generates random numbers for temperatures, inter-arrival times, and service times.

## Features
- **Random Number Generation**: The simulation allows users to choose from various random number generators to generate customer-related data, such as:
  - Temperature
  - Inter-arrival Time
  - Service Time
- **Customer Tracking**: The system tracks customers':
  - Arrival time
  - Temperature
  - Entry into the center
  - Departure time
- **Service Center Constraints**: The service center has limited capacity for customers at any given time, and only those with normal temperatures are allowed entry.
- **Simulation Output**:
  - Displays customer-related events, such as arrival, entry, and departure times.
  - Generates tables for service times and inter-arrival times.
  - Calculates and displays evaluation results such as:
    - Average waiting time
    - Average time spent
    - Probability that a customer has to wait
    - Average service time for each counter

## Assignment Details

### Key Components
- **Random Number Generators**: The simulation allows the user to choose the type of random number generator (e.g., linear congruential generators) for generating temperature, inter-arrival time, and service time.
- **Customer Flow Simulation**: The system simulates customer arrivals, ensures no more than the allowed number of customers are in the center at any time, and generates messages for when customers enter or leave.
- **Tables**: The simulation generates tables for:
  - Service time for different counters
  - Inter-arrival times
- **Results Evaluation**: After the simulation, the system calculates and displays:
  - Average waiting time
  - Average time spent in the center
  - Probability that a customer had to wait
  - Average service time for each counter
  
### Example Simulation Output
- **Customer Events**: 
    - "Customer 1 arrived at minute 0 and entered the centre at minute 0"
    - "Customer 2 arrived at minute 2 and entered the centre at minute 2"
    - "Departure of customer 1 at minute 4"
    - "Customer 3 arrived at minute 5 and was not allowed to enter the centre"
  
- **Tables**:
    - **Service Time Table**:
      - Contains service times for different counters.
    - **Inter-Arrival Time Table**:
      - Shows the inter-arrival time distribution for customers.
    - **Simulation Table**:
      - Displays customer-related data such as arrival time, temperature, waiting time, and service time.

### Evaluation Results:
- **Average Waiting Time**: The average time customers spent waiting before being served.
- **Average Time Spent**: The average time customers spent in the service center.
- **Probability of Waiting**: The proportion of customers who had to wait before being served.
- **Average Service Time for Each Counter**: The average service time for each counter in the center.

## Files in This Repository

- **MainScreen.m**: Main code for simulating the queue system.
- **randomizer.m**: Generates random numbers for temperatures, inter-arrival times, and service times.
- **README.md**: This file, providing an overview of the project.
- **Report.pdf**: The detailed report, including the simulation results, flowchart, and explanations of important source codes.
- **365660_Coding Assignment T2_2020.pdf**: Assignment instructions and guidelines.

## How to Run the Simulation

1. **Choose a Random Number Generator**: 
   - The simulation will display a choice of Random Number Generators for the user to select.

2. **Enter Simulation Parameters**:
   - Enter the number of customers to simulate for the entire process.
   - Enter the maximum number of customers allowed in the center at any given time.

3. **Record Customer Information**:
   - The user will need to press any key to record the following for each customer:
     - Temperature
     - Arrival time
     - Entry into the service center
     - Departure time

4. **View Customer Event Messages**:
   - The simulation will display messages about customer arrivals, entry into the center, and their departure times, dynamically as the simulation progresses.

5. **Tables of Simulation Data**:
   - After the simulation, the system will generate and display:
     - **Service Time Table**: Contains the service time data for different counters.
     - **Inter-Arrival Time Table**: Shows the time intervals between customer arrivals.

6. **Evaluation of Results**:
   - The simulation will evaluate key metrics and display the results in the following:
     - **Average Waiting Time**: The average time customers spent waiting before being served.
     - **Average Time Spent**: The average time customers spent in the center.
     - **Probability of Waiting**: The proportion of customers who had to wait before being served.
     - **Average Service Time for Each Counter**: The average service time for each counter in the center.

## License
This project is part of the TMA1301 Computational Methods course. All rights are reserved to the authors listed in the report.
