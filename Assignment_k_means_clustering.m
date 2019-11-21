load mnist_train

point = digits(:,1:10000);

distance_vector = zeros(1,20);

vector = zeros(784,20);
for i = 1:20
    x = randi(10000,1,1);
    vector(:,i) = point(:,x);
end
centroid_vector = vector;
centroid_diff = zeros(1,20);

while norm(centroid_diff)>10.^-5
    cluster = zeros(1000,20);
    for i=1:10000
        for j=1:20
            distance_vector(j) = norm(centroid_vector(:,j)-point(:,i))
        end
        min_dis = min(distance_vector);
        min_index = fint(distance_vector==mindis)
        
        for i=1:10000
            if cluster(i,min_index)==0
                cluster(i,min_index) = point_index;      
                break
            end
        end
        vector = cluster;
        
    end
    cluster = vector;
    vector = zeros(784,20);
    for i=1:20
        sum = [];
        for j = 1:10000
         if (cluster(j,i)~=0)
            datapoint = cluster(j,i);
            
            sum = [sum,point(:,datapoint)];
         end
        end
    
    
        vector(:,i) = mean(sum,2);
    end
        new_centroid_vector = vector;
        
        centroid_diff = new_centroid_vector-centroid_vector;
        centroid_vector = new_centroid_vector; 
end  

for k = 1:20
    subplot(4,5,k)
    imshow(reshape(centroid_vector(:,k),28,28))
end

   


  
