################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/stats/examples/double-probe-example.cc \
../forbackup/src/stats/examples/file-aggregator-example.cc \
../forbackup/src/stats/examples/file-helper-example.cc \
../forbackup/src/stats/examples/gnuplot-aggregator-example.cc \
../forbackup/src/stats/examples/gnuplot-example.cc \
../forbackup/src/stats/examples/gnuplot-helper-example.cc \
../forbackup/src/stats/examples/time-probe-example.cc 

CC_DEPS += \
./forbackup/src/stats/examples/double-probe-example.d \
./forbackup/src/stats/examples/file-aggregator-example.d \
./forbackup/src/stats/examples/file-helper-example.d \
./forbackup/src/stats/examples/gnuplot-aggregator-example.d \
./forbackup/src/stats/examples/gnuplot-example.d \
./forbackup/src/stats/examples/gnuplot-helper-example.d \
./forbackup/src/stats/examples/time-probe-example.d 

OBJS += \
./forbackup/src/stats/examples/double-probe-example.o \
./forbackup/src/stats/examples/file-aggregator-example.o \
./forbackup/src/stats/examples/file-helper-example.o \
./forbackup/src/stats/examples/gnuplot-aggregator-example.o \
./forbackup/src/stats/examples/gnuplot-example.o \
./forbackup/src/stats/examples/gnuplot-helper-example.o \
./forbackup/src/stats/examples/time-probe-example.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/stats/examples/%.o: ../forbackup/src/stats/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


