################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/stats/model/boolean-probe.cc \
../forbackup/src/stats/model/data-calculator.cc \
../forbackup/src/stats/model/data-collection-object.cc \
../forbackup/src/stats/model/data-collector.cc \
../forbackup/src/stats/model/data-output-interface.cc \
../forbackup/src/stats/model/double-probe.cc \
../forbackup/src/stats/model/file-aggregator.cc \
../forbackup/src/stats/model/get-wildcard-matches.cc \
../forbackup/src/stats/model/gnuplot-aggregator.cc \
../forbackup/src/stats/model/gnuplot.cc \
../forbackup/src/stats/model/omnet-data-output.cc \
../forbackup/src/stats/model/probe.cc \
../forbackup/src/stats/model/sqlite-data-output.cc \
../forbackup/src/stats/model/time-data-calculators.cc \
../forbackup/src/stats/model/time-probe.cc \
../forbackup/src/stats/model/time-series-adaptor.cc \
../forbackup/src/stats/model/uinteger-16-probe.cc \
../forbackup/src/stats/model/uinteger-32-probe.cc \
../forbackup/src/stats/model/uinteger-8-probe.cc 

CC_DEPS += \
./forbackup/src/stats/model/boolean-probe.d \
./forbackup/src/stats/model/data-calculator.d \
./forbackup/src/stats/model/data-collection-object.d \
./forbackup/src/stats/model/data-collector.d \
./forbackup/src/stats/model/data-output-interface.d \
./forbackup/src/stats/model/double-probe.d \
./forbackup/src/stats/model/file-aggregator.d \
./forbackup/src/stats/model/get-wildcard-matches.d \
./forbackup/src/stats/model/gnuplot-aggregator.d \
./forbackup/src/stats/model/gnuplot.d \
./forbackup/src/stats/model/omnet-data-output.d \
./forbackup/src/stats/model/probe.d \
./forbackup/src/stats/model/sqlite-data-output.d \
./forbackup/src/stats/model/time-data-calculators.d \
./forbackup/src/stats/model/time-probe.d \
./forbackup/src/stats/model/time-series-adaptor.d \
./forbackup/src/stats/model/uinteger-16-probe.d \
./forbackup/src/stats/model/uinteger-32-probe.d \
./forbackup/src/stats/model/uinteger-8-probe.d 

OBJS += \
./forbackup/src/stats/model/boolean-probe.o \
./forbackup/src/stats/model/data-calculator.o \
./forbackup/src/stats/model/data-collection-object.o \
./forbackup/src/stats/model/data-collector.o \
./forbackup/src/stats/model/data-output-interface.o \
./forbackup/src/stats/model/double-probe.o \
./forbackup/src/stats/model/file-aggregator.o \
./forbackup/src/stats/model/get-wildcard-matches.o \
./forbackup/src/stats/model/gnuplot-aggregator.o \
./forbackup/src/stats/model/gnuplot.o \
./forbackup/src/stats/model/omnet-data-output.o \
./forbackup/src/stats/model/probe.o \
./forbackup/src/stats/model/sqlite-data-output.o \
./forbackup/src/stats/model/time-data-calculators.o \
./forbackup/src/stats/model/time-probe.o \
./forbackup/src/stats/model/time-series-adaptor.o \
./forbackup/src/stats/model/uinteger-16-probe.o \
./forbackup/src/stats/model/uinteger-32-probe.o \
./forbackup/src/stats/model/uinteger-8-probe.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/stats/model/%.o: ../forbackup/src/stats/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


