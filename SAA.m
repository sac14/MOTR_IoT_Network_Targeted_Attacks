clc
clear all;
close all;
%%%%%%%%%%% Initilizing General Variables %%%%%%%%%%%%%%%%%
R = 250; %radius of circle
Range = 200; %transmission range of nodes
N = 30; %number of nodes
Degree=zeros(1,N);
fitness_func_R=0;
no_of_chrom=20;
pop_members=no_of_chrom/2; %number of members in a population
neighbour_limit=60; %no of neighbours each node can form
degree_check(1,N)=0;% to check degree of nodes in a adjacency matrix
B_D(N,N,no_of_chrom)=0; %initializing 3D matrix for storing adjacency matrix of population
max_step=100; % maximum itrations in SA
alpha=0.9;
%%%%%%%%%%%%%% Start cirle with diameter 500m, for defining field
t=0:pi/500:2*pi; 
x1=R*cos(t);
y1=R*sin(t);
plot(x1,y1,'r', 'LineWidth',2.0)
xlabel('Diameter (meters)');
ylabel('Diameter (meters)');
hold on;
%%%%%%%%%%%%% End cirle with diameter 500m, for defining field
distance= @(x,y) sqrt(((x.xd-y.xd)^2) + ((x.yd-y.yd)^2)); %Calculating Ecladian Distance

for i=1:N
    r=R;
    th=2*pi;
    r=r * rand ;
    th=th * rand ;
    x=r*(cos(th));
    y=r*(sin(th));
%%%% Start cirle with radius 200m, for defining nodes range    
    th = 0:pi/50:2*pi;
    xunit = Range * cos(th) + x;
    yunit = Range * sin(th) + y;
    plot(xunit, yunit, 'g', 'LineWidth',0.5);
    hold on
%%%% End cirle with radius 200m, for defining nodes range
    S(i).xd=x;
    S(i).yd=y;
    S(i).Nei= [];
    plot(S(i).xd,S(i).yd,'b.','MarkerSize',10)
    hold on
end

plot(x1,y1,'r', 'LineWidth',2.0)
title(['\fontsize{13}{\color{blue} Network Plot (150)}'])
hold on
plot(S(i).xd,S(i).yd,'b.','MarkerSize',10)
for i=1:N
    index=1;
    for j=1:N
           if i~=j
                distance_with_node =  distance(S(i),S(j));

                if distance_with_node <= Range 
                    S(i).Nei (index)= j;
                    index=index+1;
                    hold on
                end               
           end
    end   
end

%%%%%%%%%%%%%%%%%%%%% Start of Adjacency Matrix %%%%%%%%%%%%%%%%%%%%
for i=1:N
    for j=1:N
        Member_check = ismember(i, S(j).Nei(:));
        if Member_check == 0
            A(i,j) = 0;
        else
            A(i,j) =1;
        end
    end
    Degree(i)=numel(S(i).Nei);
end
%%%%%%%%%%%%% End of Adjacency Matrix %%%%%%%%%%%%%%% 
%%%%%%%%%%%%% Start of Charomosome %%%%%%%%%%%%%%%%
j=1;
k=1;
l=N;
for i=j:N
  for m=j:N
    A(j,m);
     chrom(1,k)= A(j,m); % generating charomosome of orignal topology
     k=k+1;
  end
  j=j+1;    
end
%%%%%%%%%%%%% End of Charomosome %%%%%%%%%%%%%%%%
G = graph(A)
figure;
plot(G);

%%%%%%%%%%%%%%% Multiple Neighbours 3D Matix %%%%%%%%%%%%
B_D(:,:,1)=A; %storing orignal topology in 1st position of population
for k=2:no_of_chrom    %filling 2nd to 19th topologies in population 
    B_D(:,:,k)=A;
    for j=1:N
        degree_check(1,j)= sum(B_D(j,:,k));
        while degree_check(1,j) > neighbour_limit %applying edge limit n topology over population
            B_D(j,ceil(rand(1)*N),k)=0;     %deleting random edge from adjacency matrix for randomization        
            degree_check(1,j)= sum(B_D(j,:,k));
        end        
    end    
end
%%%%%%%%%%%%%%%%%%%%%%%%   Generating 1st population  %%%%%%%%%%%%%%%%%%
for i=1:pop_members %pop_members is limit of number of members in population
    pop1_adj(:,:,i)=B_D(:,:,i);    %saving first half of B_D in pop1_adj    
end  
%%%%%% Calculating R of 1st Population Set %%%%%%%%%%%%%%%%%%%%%
SA=pop1_adj;   
for n=1:pop_members %pop_members is limit of number of members in population
        c=SA(:,:,n);    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end
    %%%%%%%%%%%%%%%%%%%% Calculating R   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Calculating Maximum Degree Node %%%%%%%%%%%%%%%%
    [max_num,max_idx] = max(degree_R(:));
    max_idx;
    %%%%%%%%%%%% Deleting Maximum Degree Node %%%%%%%%%%%%%%%%%%
    A_D=c;
    A_D(:,max_idx)=0;
    A_D(max_idx,:)=0;
    %%%%%%%%% Finding 2nd Maximum degree %%%%%%%%%%%%%%%%%%%%%%%
    second_Degree(1,N)=0;
    for i=1:N
        for j=1:N
            second_Degree(j)= sum(A_D(:,j));
        end
    end
    [second_max_num,second_max_idx] = max(second_Degree(:));
    second_max_idx;
    %%%%%%%%%%%%%% Finding 90% Degrees in Comparison to Maximum degree %%%%%
    ninty_percent_max_degree=(max_num/100)*90;
    ninty_percent_threshold=0;
    num_ninty_percent_nodes=0;
   for j=1:N
        if second_Degree(j)>= ninty_percent_max_degree;
           num_ninty_percent_nodes= num_ninty_percent_nodes+1;
        end
   end
    num_ninty_percent_nodes;
    %%%%%%% Calculating Fittness Function R %%%%%%%
    fitness_func_R= num_ninty_percent_nodes/N;
     schineder_SA(n)=fitness_func_R;
     schineder_SA(n);
%%%%%%%%%%%%%%%%%%%%%% End of R  %%%%%%%%%%%%%%%%%%%%%%%%%%%
    end %% end of SA limit

    
%%%%% Start of Simulating Anealing %%%%%%%%%%%%%%%%%    
    
To=-(max(schineder_SA)-min(schineder_SA))/log(0.8);
SA_temp(100,100)=0;
SA_temp_1(100,100)=0;
SA_temp=SA(:,:,2);
for p=1:max_step
    
  %%%%%%%%%%% Calculating R for SA_temp %%%%%%%%%%
    c=SA_temp;    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end

    %%%%%%%%%%%%%%%%%%%% Calculating R   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Calculating Maximum Degree Node %%%%%%%%%%%%%%%%
    [max_num,max_idx] = max(degree_R(:));
    max_idx;
    %%%%%%%%%%%% Deleting Maximum Degree Node %%%%%%%%%%%%%%%%%%
    A_D=c;
    A_D(:,max_idx)=0;
    A_D(max_idx,:)=0;
    %%%%%%%%% Finding 2nd Maximum degree %%%%%%%%%%%%%%%%%%%%%%%
    second_Degree(1,N)=0;
    for i=1:N
        for j=1:N
            second_Degree(j)= sum(A_D(:,j));
        end
    end
    [second_max_num,second_max_idx] = max(second_Degree(:));
    second_max_idx;
    %%%%%%%%%%%%%% Finding 90% Degrees in Comparison to Maximum degree %%%%%
    ninty_percent_max_degree=(max_num/100)*90;
    ninty_percent_threshold=0;
    num_ninty_percent_nodes=0;
   for j=1:N
        if second_Degree(j)>= ninty_percent_max_degree;
           num_ninty_percent_nodes= num_ninty_percent_nodes+1;
        end
   end
    num_ninty_percent_nodes;
    %%%%%%% Calculating Fittness Function R %%%%%%%
    fitness_func_R= num_ninty_percent_nodes/N;
     schineder_SA_temp=fitness_func_R;
  
  %%%% End of R Calculation for SA_temp %%%%%%%%%%
  
SA_temp_1=SA_temp;    
  %%%%%%%% Finding two edges %%%%%%
  
    for k=1:N
    algo_degree(k)=sum(SA_temp_1(:,k));    
    end
%%%% calculating first maximum degree node 

 node1_index= ceil(rand(1)*N);
 node1_degree= algo_degree(node1_index);
%%%% calculating second maximum degree node 
algo_degree_second=algo_degree;
algo_degree_second(max_idx)=0;
[max_num,max_idx] = max(algo_degree_second(:));
Member_check=0;
for i=1:N
    
    if Member_check<algo_degree_second(i)
        if SA_temp_1(node1_index,i)==0
            if SA_temp_1(i,node1_index)==0
        node2_index=i; 
        node2_degree=algo_degree_second(i);
            end
        end
    end
end
node2_index;
node2_degree;
 
%%%%% Calculating partner of node 1 %%%%%
degree_member_check=0;
node1_neighbour_degree=0;
node1_neighbour_index=0;
for i=1:N

    Member_check =SA_temp_1(i,node1_index);

    if Member_check == 1 && i~=node2_index && i~=node1_index%checking edges of node 1
       if SA_temp_1(i,node2_index)==0
           
                degree_member_check=sum(SA_temp_1(:,i)); %if edge exists with any node then calculate degree of that node
                if node1_neighbour_degree<degree_member_check
                    node1_neighbour_degree= degree_member_check ;
                    node1_neighbour_index=i;
                end
           
        end
    end
end
if (node1_neighbour_index)==0
node1_neighbour_index=ceil(rand(1)*N);
node1_neighbour_degree=algo_degree(node1_neighbour_index);
end
node1_neighbour_index;
node1_neighbour_degree;


%%%% Calculating partner of node 2 %%%%%
degree_member_check=0;
node2_neighbour_degree=0;
node2_neighbour_index=0;
for i=1:N

    Member_check =SA_temp_1(i,node2_index);
    if Member_check == 1  
        if SA_temp_1(i,node1_index)==0 
            if SA_temp_1(i,node1_neighbour_index)==0 %checking edges of node 1
                degree_member_check=sum(SA_temp_1(:,i)); %if edge exists with any node then calculate degree of that node
                    if node2_neighbour_degree<degree_member_check
                        node2_neighbour_degree= degree_member_check ;
                        node2_neighbour_index=i;
                    end
            end
        end
    end
end

if (node2_neighbour_index)==0
node2_neighbour_index=ceil(rand(1)*N);
node2_neighbour_degree=algo_degree(node2_neighbour_index);
end
SA_temp_1(node1_index,node2_index)=1; %%making edge between node i and node k
SA_temp_1(node2_index,node1_index)=1; %%making edge between node k and node i
SA_temp_1(node1_neighbour_index,node2_neighbour_index)=1; %%making edge between node j and node l
SA_temp_1(node2_neighbour_index,node1_neighbour_index)=1; %%making edge between node l and node j  

  %%%%%%%%%%% Again Calculating R for SA_temp_1 after new edges %%%%%%%%%%
    c=SA_temp_1;    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end

    %%%%%%%%%%%%%%%%%%%% Calculating R   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% Calculating Maximum Degree Node %%%%%%%%%%%%%%%%
    [max_num,max_idx] = max(degree_R(:));
    max_idx;
    %%%%%%%%%%%% Deleting Maximum Degree Node %%%%%%%%%%%%%%%%%%
    A_D=c;
    A_D(:,max_idx)=0;
    A_D(max_idx,:)=0;
    %%%%%%%%% Finding 2nd Maximum degree %%%%%%%%%%%%%%%%%%%%%%%
    second_Degree(1,N)=0;
    for i=1:N
        for j=1:N
            second_Degree(j)= sum(A_D(:,j));
        end
    end
    [second_max_num,second_max_idx] = max(second_Degree(:));
    second_max_idx;
    %%%%%%%%%%%%%% Finding 90% Degrees in Comparison to Maximum degree %%%%%
    ninty_percent_max_degree=(max_num/100)*90;
    ninty_percent_threshold=0;
    num_ninty_percent_nodes=0;
   for j=1:N
        if second_Degree(j)>= ninty_percent_max_degree;
           num_ninty_percent_nodes= num_ninty_percent_nodes+1;
        end
   end
    num_ninty_percent_nodes;
    %%%%%%% Calculating Fittness Function R %%%%%%%
    fitness_func_R= num_ninty_percent_nodes/N;
     schineder_SA_temp_second=fitness_func_R;
  
  %%%% End of Again Re- R Calculation for SA_temp_1 %%%%%%%%%%
ninty_per_To=(To/100)*40;
p
T(p)=(alpha.^p)*To;  
  if schineder_SA_temp_second>schineder_SA_temp 
        SA_temp=SA_temp_1; 
  end
  if schineder_SA_temp_second>((schineder_SA_temp/100)*90) && T(p)>To
           SA_temp=SA_temp_1;  
  end


  
schineder_SA_check(p)=schineder_SA_temp_second;
schineder_SA_check_2(p)=schineder_SA_temp;
end

G1 = graph(SA_temp)
figure;
plot(G1);

figure;
plot(schineder_SA_check_2, 'b','LineWidth',2.00);
title(['\fontsize{13}{\color{blue} Simulated Annealing (150)}'])
legend('SIMULATING ANEALING');
ylabel('R','fontsize',20)
xlabel('Number of Iterations','fontsize',20)