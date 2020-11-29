################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/fifth.cc \
../scratch/fifth2.cc \
../scratch/first.cc \
../scratch/fourth.cc \
../scratch/scratch-simulator.cc \
../scratch/second.cc \
../scratch/simple-global-routing.cc 

CC_DEPS += \
./scratch/fifth.d \
./scratch/fifth2.d \
./scratch/first.d \
./scratch/fourth.d \
./scratch/scratch-simulator.d \
./scratch/second.d \
./scratch/simple-global-routing.d 

OBJS += \
./scratch/fifth.o \
./scratch/fifth2.o \
./scratch/first.o \
./scratch/fourth.o \
./scratch/scratch-simulator.o \
./scratch/second.o \
./scratch/simple-global-routing.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/%.o: ../scratch/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


