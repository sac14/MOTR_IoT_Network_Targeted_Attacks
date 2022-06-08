clc
clear all;
close all;
%%%%%%%%%%% Initilizing General Variables %%%%%%%%%%%%%%%%%
R = 250; %radius of circle
Range = 200; %transmission range of nodes
N = 100; %number of nodes
Degree=zeros(1,N);
fitness_func_R=0;
no_of_chrom=20;
pop_members=no_of_chrom/2; %number of members in a population
neighbour_limit=60; %no of neighbours each node can form
degree_check(1,N)=0;% to check degree of nodes in a adjacency matrix
B_D(N,N,no_of_chrom)=0; %initializing 3D matrix for storing adjacency matrix of population
max_step=100; % maximum itrations in SA
alpha=0.9;
ROSE_temp(100,100)=0;
ROSE_temp_1(100,100)=0;
Avg=100;
plot_temp=zeros(1,N);
for z=1:Avg

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

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%%%%%%%%%% Calculating R for ROSE_temp %%%%%%%%%%
    c=SA_temp;    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end

 %%%%%%%%%%%%%%%%%%%% Start of Angle Sum Operation %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Calculating Network Centroid %%%%%%
%     c=ROSE_temp_1;       
%   
%             for k=1:N
%                 degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
%             end
%     [centroid_degree,centroid_index] = max(degree_R(:));
%     centroid_index;
    centroid_degree=sum(c(:,1))
    centroid_index=1
%%%%%%%% Finding two edges %%%%%%  
      while ((node1_index==0) || (node2_index==0) || (node1_neighbour_index==0) || (node2_neighbour_index==0)) 
    
        for k=1:N
            algo_degree(k)=sum(ROSE_temp_1(:,k));    
        end    
            %%%%%%%%%%% Process of finding two edges %%%%%%%%%%%%%%
            %%%%%%%%%%% calculating first node %%%%%%%%%%%%%

        node1_index= ceil(rand(1)*N); %%%%Finding 1st Random Node
        node1_degree= algo_degree(node1_index);  %%%% Calculate degree of first random node
            %%%% calculating second random node
        ROSE_degree_second=algo_degree;
        ROSE_degree_second(max_idx)=0;
        [max_num,max_idx] = max(ROSE_degree_second(:));
        Member_check=0;        
        for i=1:N    
            if Member_check<ROSE_degree_second(i)
                    node2_index= ceil(rand(1)*N); %%%%Finding 1st Random Node
                    node2_degree= algo_degree(node2_index);  %%%% Calculate degree of first random node
                if ROSE_temp_1(node1_index,i)==0 %%checking column of node1_index
                    if ROSE_temp_1(i,node1_index)==0 %%%% Refer to picture, selection of highest degree having no edge with node 1
                        node2_index=i; 
                        node2_degree=ROSE_degree_second(i);
                         break
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
            Member_check =ROSE_temp_1(i,node1_index);
            if Member_check == 1 && i~=node2_index && i~=node1_index%checking edges of node 1
                if ROSE_temp_1(i,node2_index)==0           
                    degree_member_check=sum(ROSE_temp_1(:,i)); %if edge exists with any node then calculate degree of that node
                    if node1_neighbour_degree<degree_member_check
                        node1_neighbour_degree= degree_member_check ;
                        node1_neighbour_index=i;
                    end
           
                end
            end
        end
        node1_neighbour_index;
        node1_neighbour_degree;


            %%%% Calculating partner of node 2 %%%%%
        degree_member_check=0;
        node2_neighbour_degree=0;
        node2_neighbour_index=0;
        for i=1:N

            Member_check =ROSE_temp_1(i,node2_index);
            % Member_check = ismember(i, node2_index); %%check all rows of node2_index
                if Member_check == 1  
                    if ROSE_temp_1(i,node1_index)==0 
                        if ROSE_temp_1(i,node1_neighbour_index)==0 %checking edges of node 1
                            degree_member_check=sum(ROSE_temp_1(:,i)); %if edge exists with any node then calculate degree of that node
                                if node2_neighbour_degree<degree_member_check
                                        node2_neighbour_degree= degree_member_check ;
                                        node2_neighbour_index=i;
                                end
                        end
                    end
                end
        end
    end %%%% End of while loop for non zero edge calculation
n_i=node1_index;
n_i_d=node1_degree;
n_j=node1_neighbour_index;
n_j_d=node1_neighbour_degree;
n_k=node2_index;
n_k_d=node2_degree;
n_l=node2_neighbour_index;
n_l_d=node2_neighbour_degree;
    if (centroid_index~=node1_index && centroid_index~=node2_index && centroid_index~=node1_neighbour_index && centroid_index~=node2_neighbour_index)
    
        m1_xd=(S(node1_index).xd+S(node1_neighbour_index).xd)/2;  %%%%% Calculating x axis value mid point to edge i and j
        m1_yd=(S(node1_index).yd+S(node1_neighbour_index).yd)/2;  %%%%% Calculating y axis value mid point to edge i and j
        m2_xd=(S(node2_index).xd+S(node2_neighbour_index).xd)/2;  %%%%% Calculating x axis value mid point to edge k and l
        m2_yd=(S(node2_index).yd+S(node2_neighbour_index).yd)/2;  %%%%% Calculating y axis value mid point to edge k and l
        
        len_a_alpha_scheme1=sqrt(abs((S(centroid_index).xd-S(n_j).xd).^2)+abs((S(centroid_index).yd-S(n_j).yd).^2));
        len_b_alpha_scheme1=sqrt(abs((S(n_i).xd-S(centroid_index).xd).^2)+abs((S(n_i).yd-S(centroid_index).yd).^2));
        len_c_alpha_scheme1=sqrt(abs((S(n_j).xd-S(n_i).xd).^2)+abs((S(n_j).yd-S(n_i).yd).^2));
        
        if len_b_alpha_scheme1<len_a_alpha_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_alpha_scheme1; %if len b is less than len a then swap
            temp_b=len_a_alpha_scheme1; %if len b is less than len a then swap
            len_a_alpha_scheme1=temp_a; %if len b is less than len a then swap
            len_b_alpha_scheme1=temp_b; %if len b is less than len a then swap
        end
        
        alpha_scheme1=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        
        len_a_beta_scheme1=sqrt(abs((S(centroid_index).xd-S(n_l).xd).^2)+abs((S(centroid_index).yd-S(n_l).yd).^2));
        len_b_beta_scheme1=sqrt(abs((S(n_k).xd-S(centroid_index).xd).^2)+abs((S(n_k).yd-S(centroid_index).yd).^2));
        len_c_beta_scheme1=sqrt(abs((S(n_l).xd-S(n_k).xd).^2)+abs((S(n_l).yd-S(n_k).yd).^2));
        if len_b_beta_scheme1<len_a_beta_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_beta_scheme1;  %if len b is less than len a then swap
            temp_b=len_a_beta_scheme1;  %if len b is less than len a then swap
            len_a_beta_scheme1=temp_a;  %if len b is less than len a then swap
            len_b_beta_scheme1=temp_b;  %if len b is less than len a then swap
        end        
        beta_scheme1=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        
        scheme1angle=alpha_scheme1+beta_scheme1;
        
        len_a_alpha_scheme2=sqrt(abs((S(centroid_index).xd-S(n_k).xd).^2)+abs((S(centroid_index).yd-S(n_k).yd).^2));
        len_b_alpha_scheme2=sqrt(abs((S(n_i).xd-S(centroid_index).xd).^2)+abs((S(n_i).yd-S(centroid_index).yd).^2));
        len_c_alpha_scheme2=sqrt(abs((S(n_k).xd-S(n_i).xd).^2)+abs((S(n_k).yd-S(n_i).yd).^2));        
        if len_b_alpha_scheme1<len_a_alpha_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_alpha_scheme1;  %if len b is less than len a then swap
            temp_b=len_a_alpha_scheme1;  %if len b is less than len a then swap
            len_a_alpha_scheme1=temp_a;  %if len b is less than len a then swap
            len_b_alpha_scheme1=temp_b;  %if len b is less than len a then swap
        end        
        alpha_scheme2=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        
        
        len_a_beta_scheme2=sqrt(abs((S(centroid_index).xd-S(n_l).xd).^2)+abs((S(centroid_index).yd-S(n_l).yd).^2));
        len_b_beta_scheme2=sqrt(abs((S(n_j).xd-S(centroid_index).xd).^2)+abs((S(n_j).yd-S(centroid_index).yd).^2));
        len_c_beta_scheme2=sqrt(abs((S(n_j).xd-S(n_l).xd).^2)+abs((S(n_j).yd-S(n_l).yd).^2));        
        if len_b_beta_scheme1<len_a_beta_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_beta_scheme1;  %if len b is less than len a then swap
            temp_b=len_a_beta_scheme1;  %if len b is less than len a then swap
            len_a_beta_scheme1=temp_a;  %if len b is less than len a then swap
            len_b_beta_scheme1=temp_b;  %if len b is less than len a then swap
        end   
        beta_scheme2=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        scheme2angle=alpha_scheme2+beta_scheme2;
        
        len_a_alpha_scheme3=sqrt(abs((S(centroid_index).xd-S(n_j).xd).^2)+abs((S(centroid_index).yd-S(n_j).yd).^2));
        len_b_alpha_scheme3=sqrt(abs((S(n_k).xd-S(centroid_index).xd).^2)+abs((S(n_k).yd-S(centroid_index).yd).^2));
        len_c_alpha_scheme3=sqrt(abs((S(n_j).xd-S(n_k).xd).^2)+abs((S(n_j).yd-S(n_k).yd).^2));        
        if len_b_alpha_scheme1<len_a_alpha_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_alpha_scheme1;  %if len b is less than len a then swap
            temp_b=len_a_alpha_scheme1;  %if len b is less than len a then swap
            len_a_alpha_scheme1=temp_a;  %if len b is less than len a then swap
            len_b_alpha_scheme1=temp_b;  %if len b is less than len a then swap
        end        
        alpha_scheme3=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        
        
        len_a_beta_scheme3=sqrt(abs((S(centroid_index).xd-S(n_l).xd).^2)+abs((S(centroid_index).yd-S(n_l).yd).^2));
        len_b_beta_scheme3=sqrt(abs((S(n_i).xd-S(centroid_index).xd).^2)+abs((S(n_i).yd-S(centroid_index).yd).^2));
        len_c_beta_scheme3=sqrt(abs((S(n_l).xd-S(n_i).xd).^2)+abs((S(n_j).yd-S(n_l).yd).^2));        
        if len_b_beta_scheme1<len_a_beta_scheme1  %%% to make sure that len a is less than len b
            temp_a=len_b_beta_scheme1;  %if len b is less than len a then swap
            temp_b=len_a_beta_scheme1;  %if len b is less than len a then swap
            len_a_beta_scheme1=temp_a;  %if len b is less than len a then swap
            len_b_beta_scheme1=temp_b;  %if len b is less than len a then swap
        end           
        beta_scheme3=acos((len_b_alpha_scheme1.^2+len_c_alpha_scheme1.^2-len_a_alpha_scheme1.^2)/(2*len_b_alpha_scheme1*len_c_alpha_scheme1))
        scheme3angle=alpha_scheme3+beta_scheme3;
        
        if scheme1angle>scheme2angle
            schineder_ROSE_temp_new; 
            ROSE_temp_2=ROSE_temp_1; 
            ROSE_temp_2(n_i,n_j)=0;
            ROSE_temp_2(n_j,n_i)=0;
            ROSE_temp_2(n_k,n_l)=0;
            ROSE_temp_2(n_l,n_k)=0;  

            ROSE_temp_2(n_i,n_k)=1;
            ROSE_temp_2(n_k,n_i)=1;
            ROSE_temp_2(n_j,n_l)=1;
            ROSE_temp_2(n_l,n_j)=1;
                        %%%%%%%%%%% Calculating R for ROSE_temp %%%%%%%%%%
        c=ROSE_temp_2;    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end

            %%%%%%%%%%%%%%%%%%%% Calculating R %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            schineder_ROSE_temp_new=fitness_func_R;

            %%%% End of R Calculation for ROSE_temp %%%%%%%%%%
            if schineder_ROSE_temp_new>schineder_ROSE_temp
                ROSE_temp_1=ROSE_temp_2;
            end        
        end
        if scheme1angle>scheme3angle
            schineder_ROSE_temp_new;    
            ROSE_temp_2=ROSE_temp_1; 
            ROSE_temp_2(n_i,n_j)=0;
            ROSE_temp_2(n_j,n_i)=0;
            ROSE_temp_2(n_k,n_l)=0;
            ROSE_temp_2(n_l,n_k)=0;  

            ROSE_temp_2(n_i,n_l)=1;
            ROSE_temp_2(n_l,n_i)=1;
            ROSE_temp_2(n_j,n_k)=1;
            ROSE_temp_2(n_k,n_j)=1;  
                        %%%%%%%%%%% Calculating R for ROSE_temp %%%%%%%%%%
        c=ROSE_temp_2;    %sconverting 3D matrix into 2D matric for calculation of R    
  
            for k=1:N
                degree_R(k)=sum(c(:,k));    %%degree calculation of matrix C, ready for calculation of schineder R
            end

            %%%%%%%%%%%%%%%%%%%% Calculating R %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
            schineder_ROSE_temp_new=fitness_func_R;

            %%%% End of R Calculation for ROSE_temp %%%%%%%%%%
            if schineder_ROSE_temp_new>schineder_SA_temp_second
                SA_temp=ROSE_temp_2;
            end   
        end  
        
    end
    
    
%%%% End of Angle Sum Operation %%%%%%%%%
  
  
 %%%%%%%%%%% Again Calculating R for SA_temp_1 after new edges %%%%%%%%%%
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
     schineder_SA_temp_Final=fitness_func_R;
  
  %%%% End of Again Re- R Calculation for SA_temp_1 %%%%%%%%%%  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%schineder_SA_check(p)=schineder_SA_temp_second;
schineder_SA_check_2(p)=schineder_SA_temp_Final;
end

plot_temp=plot_temp+schineder_SA_check_2;
end

plot_temp=plot_temp/Avg;

figure;
plot(plot_temp, 'b','LineWidth',2.00);
title(['\fontsize{13}{\color{blue} Enhanced Simulated Annealing}'])
legend('ANGLE SUM SIMULATING ANEALING');
ylabel('R','fontsize',20)
xlabel('Number of Iterations','fontsize',20)