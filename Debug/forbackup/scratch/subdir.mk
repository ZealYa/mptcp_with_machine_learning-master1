################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/scratch/fifth.cc \
../forbackup/scratch/first.cc \
../forbackup/scratch/fourth.cc \
../forbackup/scratch/scratch-simulator.cc \
../forbackup/scratch/second.cc \
../forbackup/scratch/simple-global-routing.cc 

CC_DEPS += \
./forbackup/scratch/fifth.d \
./forbackup/scratch/first.d \
./forbackup/scratch/fourth.d \
./forbackup/scratch/scratch-simulator.d \
./forbackup/scratch/second.d \
./forbackup/scratch/simple-global-routing.d 

OBJS += \
./forbackup/scratch/fifth.o \
./forbackup/scratch/first.o \
./forbackup/scratch/fourth.o \
./forbackup/scratch/scratch-simulator.o \
./forbackup/scratch/second.o \
./forbackup/scratch/simple-global-routing.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/scratch/%.o: ../forbackup/scratch/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


